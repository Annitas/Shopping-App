//
//  ProductDetailViewViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 29.08.2023.
//

import Foundation

final class ProductDetailViewViewModel {
    let product: Advertisement
    init(product: Advertisement) {
        self.product = product
    }
    public var title: String {
        product.location.uppercased()
    }
}
