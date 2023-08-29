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
        // TODO: - Abstract to image manager
        guard let url = productImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
