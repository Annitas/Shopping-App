//
//  GetProductsResponse.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 28.08.2023.
//

import Foundation


// MARK: - Welcome
struct GetAllProductsResponse: Codable {
    let advertisements: [Advertisement]
}

struct GetDetailProductResponse: Codable {
    let productD: Detail
}
