//
//  ProductListViewViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 28.08.2023.
//

import UIKit

final class ProductListViewViewModel: NSObject {
    func fetchProducts() {
        Service.shared.execute(.listProductRequest, expecting: GetAllProductsResponse.self) { result in
                switch result{
                case .success(let model):
//                    let first = model.advertisements[0].imageURL
                    print("Example image url:" + String(model.advertisements.first?.imageURL ?? "No image") )
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
}

extension ProductListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductCollectionViewCell.cellIdentifier,
            for: indexPath) as? ProductCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = ProductCollectionViewCellViewModel(productTitle: "Anita",
                                                           productLocation: "Omsk",
                                                           productImageURL: URL(string: "https://www.avito.st/s/interns-ios/images/1.png"))
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(width: width, height: width * 1.5)
    }
}

