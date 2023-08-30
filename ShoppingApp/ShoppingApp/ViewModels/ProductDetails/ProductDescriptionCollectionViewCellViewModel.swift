//
//  ProductDescriptionCollectionViewCellViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 30.08.2023.
//

import Foundation
//    "description": "Отличное состояние, последняя модель iPhone.",
//    "email": "example1@example.com",
//    "phone_number": "+7 (123) 456-7890",
//    "address": "ул. Пушкина, д. 1"

final class ProductDescriptionCollectionViewCellViewModel {
    public let value: String
    public let title: String
//    public let location: String
//    public let createdDate: String
    
    init(value: String, title: String) {
        self.value = value
        self.title = title
//        self.location = location
//        self.createdDate = createdDate
    }
}
