//
//  Contact.swift
//  iOS-Challenge-KianDigital
//
//  Created by Mohammad Sadegh Panadgoo on 4/11/1400 AP.
//

import Foundation

struct Contact: Decodable, Hashable {
    let id: String
    let name: String
    let avatar: String
    let family: String
    let createdAt: String
    let phoneNumber: String
}
