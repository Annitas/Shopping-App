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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 3
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
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setupLayer() {
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowColor = UIColor.label.cgColor
        contentView.layer.cornerRadius = 4
        contentView.layer.shadowOffset = CGSize(width: -4, height: 4)
        contentView.layer.shadowOpacity = 0.3
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            locationLabel.heightAnchor.constraint(equalToConstant: 30),
            
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            locationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            locationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -7),
            
            locationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            titleLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -2),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
//        |   Image  |
//        |   Title  |
//        | Location |
    }
    // Save shadows when change dark mode to light mode
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupLayer()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        titleLabel.text = nil
        locationLabel.text = nil
    }
    
    public func configure(with viewModel: ProductCollectionViewCellViewModel) {
        let text = viewModel.productTitle
        let attributedText = NSMutableAttributedString(string: text)
        let font = UIFont.systemFont(ofSize: 18)
        let lineHeight = font.lineHeight + 5 // Добавляем немного дополнительного пространства между строками
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight - font.lineHeight
        attributedText.addAttribute(.font, value: font, range: NSRange(location: 0, length: text.count))
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: text.count))
        titleLabel.attributedText = attributedText
        titleLabel.numberOfLines = 0 // Устанавливаем количество строк на 0, чтобы текст не обрезался
        titleLabel.sizeToFit() // Автоматически подстраиваем размеры UILabel под текст

        
//        titleLabel.text = viewModel.productTitle
        titleLabel.sizeToFit()
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
