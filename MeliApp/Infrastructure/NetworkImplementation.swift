//
//  NetworkImplementation.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 25/11/21.
//

import Alamofire

typealias SuccessCallback = (Codable) -> Void
typealias ErrorCallback = (MeliModel.BaseError) -> Void
typealias AnyClass<T> = T.Type

internal class NetworkImplementation: NSObject {
    fileprivate var meliManager: Session?
    
    private var successCallback: SuccessCallback?
    private var errorCallback: ErrorCallback?
    private var requestData: MeliModel.Request
    private var type : Codable.Type
    
    init<T:Codable>(_ meliManager: Session, request: MeliModel.Request? = nil, type:T.Type) {
        self.meliManager = meliManager
        self.type = type
        self.requestData = request ?? MeliModel.Request(method: .post, url:  "")
    }
    
    /**
     * Execute the request
     * - Parameters:
     *      - success: Success callback of the library.
     *      - error: Error callback of the library.
     *      - showError: Show error at current view controller.
     */
    func consume<T:Codable>(success: SuccessCallback!, error: ErrorCallback? = nil, type:T.Type) {
        self.successCallback = success
        self.errorCallback = error
        
        self.meliManager?.request(requestData.url,
                                           method: requestData.method,
                                           parameters: requestData.requestBody)
            .responseDecodable(of: type){ response in
                switch response.result {
                case let .success(value):
                    self.successCallback!(value)
                case let .failure(error):
                    if let message = error.errorDescription {
                        self.errorCallback!(MeliModel.BaseError(description: message,
                                                                         statusCode: .generalError))
                    }else{
                        self.errorCallback!(MeliModel.BaseError(description: "",
                                                                         statusCode: .generalError))
                    }
                }
            }
    }
    
}

