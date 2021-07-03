//
//  LabelledDivider.swift
//  iOS-Challenge-KianDigital
//
//  Created by Mohammad Sadegh Panadgoo on 4/11/1400 AP.
//

import SwiftUI

struct CustomDividerView: View {

    let label: String
    let horizontalPadding: CGFloat

    init(label: String, horizontalPadding: CGFloat = 0) {
        self.label = label
        self.horizontalPadding = horizontalPadding
    }

    var body: some View {
        HStack {
            line
            Spacer()
            Text(label)
                .foregroundColor(.black)
                .font(.system(size: 16))
                .fontWeight(.medium)
                .lineLimit(0)
            Spacer()
            line
        }
    }
    
    var line: some View {
        VStack {
            Divider()
                .frame(height: 0.5)
                .background(Color(UIColor.lightText)) }
            .padding(horizontalPadding)
    }
}


