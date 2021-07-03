//
//  ContactView.swift
//  iOS-Challenge-KianDigital
//
//  Created by Mohammad Sadegh Panadgoo on 4/11/1400 AP.
//

import SwiftUI

struct ContactView: View {
    private let contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    var body: some View {
        HStack(alignment: .center) {
            CustomRemoteImageView(urlString: contact.avatar)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(contact.name + " "  + contact.family)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color.black)
                
                Text(contact.phoneNumber)
                    .font(.system(size: 18))
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            Button("+ Invite") {
                print("Invite button tapped")
            }
            .padding(5)
            .font(.system(size: 14).bold())
            .frame(width: 60, height: 30, alignment: .center)
            .background(Color.white)
            .foregroundColor(.gray)
            .overlay(
                Capsule()
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 1))
            )
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        let contact = Contact(id: "0", name: "Mohammad Sadegh", avatar: "https://www.pngfind.com/pngs/m/5-52097_avatar-png-pic-vector-avatar-icon-png-transparent.png", family: "Panadgoo", createdAt: "createDate", phoneNumber: "09126185482")
        ContactView(contact: contact)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
