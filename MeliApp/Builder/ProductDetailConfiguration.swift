//
//  ProductDetailConfiguration.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

class ProductDetailConfiguration {
    static func setup(parameters: [String: Any] = [:]) -> UIViewController {
        let controller = ProductDetailViewController()
        let router = ProductDetailRouter(view: controller)
        let presenter = ProductDetailPresenter(view: controller)
        let interactor = ProductDetailInteractor(presenter: presenter)
        
        controller.interactor = interactor
        controller.router = router
        interactor.parameters = parameters
        return controller
    }
}
