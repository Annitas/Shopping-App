//
//  ProductViewController.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 27.08.2023.
//

import UIKit

/// Controller to show Products
final class ProductViewController: UIViewController {
    private let productListView = ProductListView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(productListView)
        NSLayoutConstraint.activate([
            productListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            productListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            productListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
}
