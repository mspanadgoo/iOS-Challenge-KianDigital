//
//  ContactsViewModel.swift
//  iOS-Challenge-KianDigital
//
//  Created by Mohammad Sadegh Panadgoo on 4/11/1400 AP.
//

import Combine
import SwiftUI

class ContactsViewModel: ObservableObject {
    private let url = "https://60859fb1d14a8700175780be.mockapi.io/api/users"
    private var task: AnyCancellable?
    
    @Published var contacts: [Contact] = []
    
    func fetchContacts() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [Contact].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \ContactsViewModel.contacts, on: self)
    }
}
