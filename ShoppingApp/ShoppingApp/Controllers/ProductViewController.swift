//
//  ProductViewController.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 27.08.2023.
//

import UIKit

/// Controller to show Products
final class ProductViewController: UIViewController, ProductListViewDelegate {
    private let productListView = ProductListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
    }
    
    private func setupView() {
        productListView.delegate = self
        view.addSubview(productListView)
        NSLayoutConstraint.activate([
                productListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                productListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                productListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                productListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    // Open detail controller for choosen character
    func productListView(_ productListView: ProductListView, didSelectProduct product: Advertisement) {
        let viewModel = ProductDetailViewViewModel(product: product)
        let detailVC = ProductDetailViewController(viewModel: viewModel)
        present(detailVC, animated: true, completion: nil)
        print(product)
    }
}
