//
//  ProductPhotoCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 30.08.2023.
//

import UIKit

final class ProductPhotoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "ProductPhotoCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: ProductPhotoCollectionViewCellViewModel) {
        
    }
}
