//
//  HomeManager.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 25/11/21.
//

import Foundation

protocol IHomeManager: class {
    
    func getCategories(success: @escaping SuccessCallback, error: @escaping ErrorCallback)
    func searchProducts(value: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback)
    func searchProductsByCategory(id: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback)
    
}

class HomeManager: IHomeManager {
    func getCategories(success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        NetworkService.shared.consumeWebService(request: MeliModel.Request(method: .get,
                                                                                    url: ApiEndpoint.categories.rawValue),
                                                type: [Category].self,
                                                success: { response in
                                                    success(response)
                                                }, error: { errorData in
                                                    error(errorData)
                                                })
    }
    
    func searchProducts(value: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        let url = ApiEndpoint.searchProduct.rawValue + value
        let request = MeliModel.Request(method: .get,
                                                 url: url)
        NetworkService.shared.consumeWebService(request: request,
                                                type: ProductsResponse.self,
                                                success: { response in
                                                    success(response)
                                                }, error: { errorData in
                                                    error(errorData)
                                                })
    }
    
    func searchProductsByCategory(id: String, success: @escaping SuccessCallback, error: @escaping ErrorCallback) {
        let url = ApiEndpoint.searchProductByCategory.rawValue + id
        let request = MeliModel.Request(method: .get,
                                                 url: url)
        NetworkService.shared.consumeWebService(request: request,
                                                type: ProductsResponse.self,
                                                success: { response in
                                                    success(response)
                                                }, error: { errorData in
                                                    error(errorData)
                                                })

    }
}
