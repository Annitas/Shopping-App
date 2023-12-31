//
//  Products.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 27.08.2023.
//

import Foundation


// MARK: - Advertisement
struct Advertisement: Codable {
    let id, title, price, location: String
    let imageURL: String
    let createdDate: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
    }
}

struct Detail: Codable {
    let id, title, price, location: String
    let imageURL: String
    var createdDate, description, email, phoneNumber: String
    var address: String

    enum CodingKeys: String, CodingKey {
        case id, title, price, location
        case imageURL = "image_url"
        case createdDate = "created_date"
        case description, email
        case phoneNumber = "phone_number"
        case address
    }
}
