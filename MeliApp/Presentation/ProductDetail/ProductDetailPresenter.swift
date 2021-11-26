//
//  ProductDetailPresenter.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 26/11/21.
//

import UIKit

protocol IProductDetailPresenter: class {
    func loadProduct(product:Product)
    
}

class ProductDetailPresenter: IProductDetailPresenter {
    weak var view: IProductDetailViewController?
    
    init(view: IProductDetailViewController?) {
        self.view = view
    }
    func loadProduct(product: Product) {
        self.view?.loadProduct(product: product)
    }
}
