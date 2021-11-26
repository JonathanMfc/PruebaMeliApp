//
//  ProductDetailRoute.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IProductDetailRouter: class {
    func goToProductLink(url:String)
}

class ProductDetailRouter: IProductDetailRouter {
    weak var view: ProductDetailViewController?
    
    init(view: ProductDetailViewController?) {
        self.view = view
    }
    
    func goToProductLink(url: String) {
        let url : URL = URL(string: url)!
        UIApplication.shared.open(url)
    }
}
