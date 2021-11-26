//
//  ProductsListInteractor.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IProductsListInteractor: class {
    var parameters: [String: Any]? { get set }
    func loadProductsList()
}

class ProductsListInteractor: IProductsListInteractor {
    var presenter: IProductsListPresenter?
    var parameters: [String: Any]?

    init(presenter: IProductsListPresenter) {
        self.presenter = presenter
    }
    
    func loadProductsList() {
        if let products = parameters!["products"] as? [Product] {
            self.presenter?.loadProductsList(products: products)
        }
    }
}
