//
//  HomeInteractor.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IHomeInteractor: class {
    var parameters: [String: Any]? { get set }
    func getCategories()
    func handlerResponseGetCategories(categories: [Category])
    func searchProducts(value:String)
    func searchProductByCategory(id:String)
}

class HomeInteractor: IHomeInteractor {
    var presenter: IHomePresenter?
    var manager: IHomeManager?
    var parameters: [String: Any]?
    
    init(presenter: IHomePresenter, manager: IHomeManager) {
        self.presenter = presenter
        self.manager = manager
    }
    
    func getCategories() {
        self.manager?.getCategories(success: { response in
            if let data = response as? [Category]{
                self.handlerResponseGetCategories(categories: data)
            }else{
                self.presenter?.showError()
            }
        }, error: { error in
            self.presenter?.showError()
        })
    }
    
    func handlerResponseGetCategories(categories: [Category]) {
        self.presenter?.loadCategories(categories: categories)
    }
    
    func searchProducts(value: String) {
        let newValue = value.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
        manager?.searchProducts(value: newValue,
                                success: { response in
                                    if let data = response as? ProductsResponse {
                                        self.presenter?.loadProducts(products: data.results)
                                    }else{
                                        self.presenter?.showError()
                                    }
                                }, error: { error in
                                    self.presenter?.showError()
                                })
    }
    
    func searchProductByCategory(id: String) {
        manager?.searchProductsByCategory(id: id,
                                success: { response in
                                    if let data = response as? ProductsResponse {
                                        self.presenter?.loadProducts(products: data.results)
                                    }else{
                                        self.presenter?.showError()
                                    }
                                }, error: { error in
                                    self.presenter?.showError()
                                })
    }
}
