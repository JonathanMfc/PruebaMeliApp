//
//  GeneralRoute.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

enum GeneralRoute: IRouter {
    case alert(String, String, ((UIAlertAction) -> Void)?)
    case productDetail(Product)
    case productsList([Product])
}

extension GeneralRoute {
    var module: UIViewController? {
        switch self {
        case .alert(let title, let message, let completion):
            return showAlert(title: title, message: message, completion: completion)
        case .productsList(let products):
            return ProductsListConfiguration.setup(parameters: ["products":products])
        case .productDetail(let product):
            return ProductDetailConfiguration.setup(parameters: ["product":product])
        }
    }
    
    private func showAlert(title:String, message:String, completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .destructive, handler: completion))
        return alert
    }
}
