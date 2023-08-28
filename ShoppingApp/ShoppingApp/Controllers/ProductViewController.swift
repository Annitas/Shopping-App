//
//  ProductViewController.swift
//  ShoppingApp
//
//  Created by Anita Stashevskaya on 27.08.2023.
//

import UIKit

/// Controller to show Products
final class ProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        
        Service.shared.execute(.listProductRequest, expecting: Welcome.self) { result in
            switch result{
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
