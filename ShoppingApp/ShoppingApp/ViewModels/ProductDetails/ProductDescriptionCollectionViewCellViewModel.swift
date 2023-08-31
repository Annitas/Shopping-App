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
    public var products = Detail(id: "", title: "", price: "", location: "", imageURL: "", createdDate: "", description: "", email: "", phoneNumber: "", address: "")
    
    init(productID: String, title: String) {
        self.productID = productID
        self.title = title
        returnProductDetail()
    }
    
    private func returnProductDetail() {
        let request = Request(pathComponent: productID)
        Service.shared.execute(request, expecting: Detail.self) { result in
            switch result {
            case .success(let success):
                self.products.description = success.description
                self.products.address = success.address
                self.products.phoneNumber = success.phoneNumber
                self.products.email = success.email
                print(String(describing: success))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    public func fetchProd(completion: @escaping (Result<Data, Error>) -> Void) {
        Service.shared.execute(Request(pathComponent: productID),
                               expecting: GetDetailProductResponse.self) { [weak self] result in
            switch result{
            case .success(let responseModel):
                let results = responseModel.productD
                self?.products = results
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
