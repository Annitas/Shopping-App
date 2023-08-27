//
//  Products.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 27.08.2023.
//

import Foundation

struct Products: Codable {
    let id: Int
    let title: String
    let price: String
    let location: String
    let image_url: String
    let created_date: String //String?
}
