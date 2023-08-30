//
//  ProductCollectionViewCellViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 29.08.2023.
//

import Foundation

final class ProductCollectionViewCellViewModel {
    public let productTitle: String
    public let productLocation: String
    private let productImageURL: URL?

    
    init(productTitle: String,
         productLocation: String,
         productImageURL: URL?) {
        self.productTitle = productTitle
        self.productLocation = productLocation
        self.productImageURL = productImageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = productImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.downLoadImage(url, completion: completion)
    }
}
