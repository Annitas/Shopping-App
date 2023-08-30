//
//  ProductDescriptionCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 30.08.2023.
//

import UIKit

class ProductDescriptionCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "ProductDescriptionCollectionViewCell"
    
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
    
    public func configure(with viewModel: ProductDescriptionCollectionViewCellViewModel) {
        
    }
}
