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
    
    init(viewModel: ProductDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
    }
}
