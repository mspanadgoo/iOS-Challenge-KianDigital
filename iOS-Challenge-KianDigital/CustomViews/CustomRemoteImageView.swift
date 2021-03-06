//
//  RemoteImage.swift
//  iOS-Challenge-KianDigital
//
//  Created by Mohammad Sadegh Panadgoo on 4/12/1400 AP.
//

import SwiftUI
import Combine
import UIKit

class ImageCache {
  enum Error: Swift.Error {
    case dataConversionFailed
    case sessionError(Swift.Error)
  }
  static let shared = ImageCache()
  private let cache = NSCache<NSURL, UIImage>()
  private init() { }
  static func image(for url: URL) -> AnyPublisher<UIImage?, ImageCache.Error> {
    guard let image = shared.cache.object(forKey: url as NSURL) else {
      return URLSession
        .shared
        .dataTaskPublisher(for: url)
        .tryMap { (tuple) -> UIImage in
          let (data, _) = tuple
          guard let image = UIImage(data: data) else {
            throw Error.dataConversionFailed
          }
          shared.cache.setObject(image, forKey: url as NSURL)
          return image
        }
        .mapError({ error in Error.sessionError(error) })
        .eraseToAnyPublisher()
    }
    return Just(image)
      .mapError({ _ in fatalError() })
      .eraseToAnyPublisher()
  }
}

class ImageModel: ObservableObject {
  @Published var image: UIImage? = nil
  var cacheSubscription: AnyCancellable?
  init(url: URL) {
    cacheSubscription = ImageCache
      .image(for: url)
      .replaceError(with: nil)
      .receive(on: RunLoop.main, options: .none)
      .assign(to: \.image, on: self)
  }
}

struct CustomRemoteImageView : View {
  @ObservedObject var imageModel: ImageModel
  init(urlString: String) {
    imageModel = ImageModel(url: URL(string: urlString)!)
  }
  var body: some View {
    imageModel
      .image
      .map { Image(uiImage:$0).resizable() }
      ?? Image(systemName: "phone").resizable()
  }
}
