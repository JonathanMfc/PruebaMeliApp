//
//  ProductsListRoute.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IProductsListRouter: class {
    func goToProductDetail(product:Product)
}

class ProductsListRouter: IProductsListRouter {
    weak var view: ProductsListViewController?
    
    init(view: ProductsListViewController?) {
        self.view = view
    }
    
    func goToProductDetail(product: Product) {
        self.view?.navigate(type: .push, module: GeneralRoute.productDetail(product))
    }
}
