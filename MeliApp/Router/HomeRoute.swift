//
//  HomeRoute.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IHomeRouter: class {
    func goToProductsList(products:[Product])
    func showError(title:String, message:String)
}

class HomeRouter: IHomeRouter {
    weak var view: HomeViewController?
    
    init(view: HomeViewController?) {
        self.view = view
    }
    /**
        Go to View details
     */
    func goToProductsList(products: [Product]) {
        self.view?.navigate(type: .push, module: GeneralRoute.productsList(products))
    }
    
    func showError(title: String, message: String) {
        self.view?.navigate(type: .present, module: GeneralRoute.alert(title, message,nil))
    }
}
