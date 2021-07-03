//
//  SectionView.swift
//  iOS-Challenge-KianDigital
//
//  Created by Mohammad Sadegh Panadgoo on 4/12/1400 AP.
//

import SwiftUI

struct CustomSectionView: View {
    var headerTitle: String
    var contacts: [Contact]
    var isQuickAdd: Bool
    
    init(headerTitle: String, contacts: [Contact], isQuickAdd: Bool) {
        self.headerTitle = headerTitle
        self.contacts = contacts
        self.isQuickAdd = isQuickAdd
    }
    
    var body: some View {
        VStack {
            CustomDividerView(label: headerTitle, horizontalPadding: 8)
            
            ZStack {
                VStack {
                    ForEach(contacts, id: \.self) { item in
                        if isQuickAdd {
                            QuickAddContactView(contact: item)
                                .padding(10)
                        } else {
                            ContactView(contact: item)
                                .padding(10)
                        }
                        
                        if contacts.last != item {
                            Divider()
                        }
                    }
                }
                .background(Color.white)
                .cornerRadius(12.0)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 4)
            }
            .padding(18.0)
        }
    }
}
