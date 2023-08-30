//
//  ProductDetailViewViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 29.08.2023.
//

import UIKit

final class ProductDetailViewViewModel {
    private let product: Advertisement
    
    enum SectionType {
        case photo(viewModel: ProductPhotoCollectionViewCellViewModel)
        case information(viewModels: [ProductInfoCollectionViewCellViewModel])
        case description(viewModels: [ProductDescriptionCollectionViewCellViewModel])
    }
    
    public var sections: [SectionType] = []
    
    
    
    init(product: Advertisement) {
        self.product = product
        setUpSections()
    }
    
    private func setUpSections() {
        sections = [
            .photo(viewModel: .init()),
            .information(viewModels: [
                .init(),
                .init(),
                .init(),
                .init()
            ]),
            .description(viewModels: [
                .init(),
                .init(),
                .init(),
                .init()
            ])
        ]
    }
    
    private var requestUrl: URL? {
        return URL(string: product.imageURL)
    }
    
    public var title: String {
        product.location.uppercased()
    }
    
    // MARK: - Layouts
    
    public func createImageSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(0.5)
        ), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        return section
    }
    
    public func createTitleSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                     leading: 2,
                                                     bottom: 2,
                                                     trailing: 2)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150)
        ), subitems: [item, item])
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    public func createDescriptionSectionLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        ))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                     leading: 0,
                                                     bottom: 10,
                                                     trailing: 0)
        let group = NSCollectionLayoutGroup.vertical(layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(150)
        ), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        return section
    }
    
//    public func fetchProductInfo() {
//        let request = Request(pathComponent: product.id)
////        print(request)
//        Service.shared.execute(request, expecting: Advertisement.self) { result in
//            switch result {
//            case .success(let success):
//                print(String(describing: success))
//            case .failure(let error):
//                print(String(describing: error))
//            }
//        }
//    }
}
