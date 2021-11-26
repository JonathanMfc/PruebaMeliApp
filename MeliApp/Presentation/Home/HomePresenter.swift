//
//  HomePresenter.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IHomePresenter: class {
    func loadCategories(categories:[Category])
    func loadProducts(products: [Product])
    func showError()
}

class HomePresenter: IHomePresenter {
    
    weak var view: IHomeViewController?
    
    init(view: IHomeViewController?) {
        self.view = view
    }
    
    func loadCategories(categories: [Category]) {
        self.view?.loadCategories(categories: categories)
    }
    
    func loadProducts(products: [Product]) {
        self.view?.goToProductsList(products: products)
    }
    
    func showError() {
        self.view?.showError()
    }

}
