//
//  ProductListViewViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 28.08.2023.
//

import Foundation

struct ProductListViewViewModel {
    func fetchProducts() {
        Service.shared.execute(.listProductRequest, expecting: GetAllProductsResponse.self) { result in
                switch result{
                case .success(let model):
                    let first = model.advertisements[0]
                    print("WOOW \(model.advertisements.count) FIRST: \(first)")
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
}


