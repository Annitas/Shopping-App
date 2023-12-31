//
//  ProductDetailViewController.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 29.08.2023.
//

import UIKit

// MARK: - Controller to show info about single character
final class ProductDetailViewController: UIViewController {
    private let viewModel: ProductDetailViewViewModel
    private let detailView: ProductDetailView
    private let productInfo: Detail
    
    init(viewModel: ProductDetailViewViewModel) {
        self.viewModel = viewModel
        self.detailView = ProductDetailView(frame: .zero, viewModel: viewModel)
        self.productInfo = Detail(id: "", title: "", price: "", location: "", imageURL: "", createdDate: "", description: "", email: "", phoneNumber: "", address: "")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(detailView)
        addConstraints()
        
        detailView.collectionView?.delegate = self
        detailView.collectionView?.dataSource = self
        viewModel.fetchProductInfo()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}

extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        switch sectionType {
        case .photo(_):
            return 1
        case .information(let viewModels):
            return viewModels.count
        case .description(_):
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
        case .photo(let viewModel):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductPhotoCollectionViewCell.cellIdentifier,
                for: indexPath) as? ProductPhotoCollectionViewCell else { fatalError() }
            cell.configure(with: viewModel)
            return cell
        case .information(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductInfoCollectionViewCell.cellIdentifier,
                for: indexPath) as? ProductInfoCollectionViewCell else { fatalError() }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        case .description(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ProductDescriptionCollectionViewCell.cellIdentifier,
                for: indexPath) as? ProductDescriptionCollectionViewCell else { fatalError() }
            cell.configure(with: viewModels[indexPath.row])
            return cell
        }
    }
}
