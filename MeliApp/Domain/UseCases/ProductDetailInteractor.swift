//
//  ProductDetailInteractor.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IProductDetailInteractor: class {
    var parameters: [String: Any]? { get set }
    func loadProduct()
}

class ProductDetailInteractor: IProductDetailInteractor {
    var presenter: IProductDetailPresenter?
    var parameters: [String: Any]?

    init(presenter: IProductDetailPresenter) {
        self.presenter = presenter
    }
    
    func loadProduct() {
        if let product = parameters?["product"] as? Product {
            self.presenter?.loadProduct(product:product)
        }
    }
}
