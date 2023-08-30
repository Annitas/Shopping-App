//
//  ProductPhotoCollectionViewCellViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 30.08.2023.
//

import Foundation

final class ProductPhotoCollectionViewCellViewModel {
    private let imageURL: URL?
    
    
    init(imageURL: URL?) {
        self.imageURL = imageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        guard let imageURL = imageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        ImageLoader.shared.downLoadImage(imageURL, completion: completion)
    }
}
