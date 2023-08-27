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

        let request1 = Request(pathComponent: "13")
        print(request1.url)
        let request2 = Request()
        print(request2.url)
    }
}
