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
    public let productID: String
    public let title: String
    public var address: String = ""
    public var products = Detail(id: "", title: "", price: "", location: "", imageURL: "", createdDate: "", description: "", email: "", phoneNumber: "", address: "")
    
    init(productID: String, title: String) {
        self.productID = productID
        self.title = title
        returnProductDetail()
        print(products.address)
    }
    
    private func returnProductDetail() {
        let request = Request(pathComponent: productID)
        DispatchQueue.main.async {
            Service.shared.execute(request, expecting: Detail.self) { result in
                switch result {
                case .success(let data):
                    self.products = data
                    print("DETAAAILS")
//                    print(String(describing: success))
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        }
    }
}
