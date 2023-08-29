//
//  ProductCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 29.08.2023.
//

import UIKit
// MARK: - Single cell for a product
final class ProductCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "ProductCollectionViewCell"
    
    // Product image
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // Product title
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // Product location
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(locationLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            locationLabel.heightAnchor.constraint(equalToConstant: 40),
            
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            locationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            locationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            titleLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -2),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
        
//        titleLabel.backgroundColor = .blue
//        locationLabel.backgroundColor = .systemMint
//        imageView.backgroundColor = .systemCyan
//        |   Image  |
//        |   Title  |
//        | Location |
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        locationLabel.text = nil
    }
    
    public func configure(with viewModel: ProductCollectionViewCellViewModel) {
        titleLabel.text = viewModel.productTitle
        locationLabel.text = viewModel.productLocation
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
