//
//  ContactsView.swift
//  iOS-Challenge-KianDigital
//
//  Created by Mohammad Sadegh Panadgoo on 4/11/1400 AP.
//

import SwiftUI

struct ContactsView: View {
    @ObservedObject var viewModel = ContactsViewModel()
    
    var quickAddList: [Contact] {
        return viewModel.contacts.count > 4 ? Array(viewModel.contacts[0..<5]) : viewModel.contacts
    }
    
    var contactsList: [Contact] {
        return viewModel.contacts.count > 4 ? Array(viewModel.contacts[5..<viewModel.contacts.count]) : []
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Spacer(minLength: 18)
                    
                    CustomSectionView(headerTitle: "Quick Adds", contacts: quickAddList, isQuickAdd: true)
                    
                    CustomSectionView(headerTitle: "In Your Contacts", contacts: contactsList, isQuickAdd: false)
                }
                
            }
            .background(Color(UIColor.systemGroupedBackground).edgesIgnoringSafeArea(.all))
            .navigationBarTitle("Your Friends", displayMode: .inline)
            .onAppear {
                self.viewModel.fetchContacts()
            }
        }
    }
}
