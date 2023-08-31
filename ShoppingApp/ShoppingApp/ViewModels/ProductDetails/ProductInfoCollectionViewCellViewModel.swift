//
//  ProductTitleCollectionViewCellViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 30.08.2023.
//

import Foundation
//    "id": "1",
//    "title": "Смартфон Apple iPhone 12",
//    "price": "55000 ₽",
//    "location": "Москва",
//    "image_url": "https://www.avito.st/s/interns-ios/images/1.png",
//    "created_date": "2023-08-16",


final class ProductInfoCollectionViewCellViewModel {
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
