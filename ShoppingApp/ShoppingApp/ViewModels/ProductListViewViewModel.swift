//
//  ProductListViewViewModel.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 28.08.2023.
//

import UIKit

final class ProductListViewViewModel: NSObject {
    private var products: [Advertisement] = [] {
        didSet {
            for product in products {
                let viewModel = ProductCollectionViewCellViewModel(productTitle: product.title, productLocation: product.location, productImageURL: URL(string: product.imageURL))
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [ProductCollectionViewCellViewModel] = []
    
    public func fetchProducts() {
        Service.shared.execute(.listProductRequest,
                               expecting: GetAllProductsResponse.self) { [weak self] result in
                switch result{
                case .success(let responseModel):
                    let results = responseModel.advertisements
                    self?.products = results
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
}

extension ProductListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ProductCollectionViewCell.cellIdentifier,
            for: indexPath) as? ProductCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)/2
        return CGSize(width: width, height: width * 1.5)
    }
}

