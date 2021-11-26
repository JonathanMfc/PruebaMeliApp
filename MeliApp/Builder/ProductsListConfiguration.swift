//
//  ProductsListConfiguration.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

class ProductsListConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ProductsListViewController()
        let router = ProductsListRouter(view: controller)
        let presenter = ProductsListPresenter(view: controller)
        let interactor = ProductsListInteractor(presenter: presenter)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
