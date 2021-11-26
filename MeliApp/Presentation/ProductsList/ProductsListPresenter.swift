//
//  ProductsListPresenter.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IProductsListPresenter: class {
    func loadProductsList(products: [Product])
}

class ProductsListPresenter: IProductsListPresenter {
    weak var view: IProductsListViewController?
    
    init(view: IProductsListViewController?) {
        self.view = view
    }
    
    func loadProductsList(products: [Product]) {
        self.view?.loadProductsList(products: products)
    }
}
