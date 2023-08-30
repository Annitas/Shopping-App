//
//  ProductDetailViewViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 29.08.2023.
//

import Foundation

final class ProductDetailViewViewModel {
    private let product: Advertisement
    
    enum SectionTypes: CaseIterable {
        case image
        case title
        case description
    }
    
    public let sections = SectionTypes.allCases
    
    
    
    init(product: Advertisement) {
        self.product = product
    }
    
    private var requestUrl: URL? {
        return URL(string: product.imageURL)
    }
    
    public var title: String {
        product.location.uppercased()
    }
    
    public func fetchProductInfo() {
        let request = Request(pathComponent: product.id)
//        print(request)
        Service.shared.execute(request, expecting: Advertisement.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
