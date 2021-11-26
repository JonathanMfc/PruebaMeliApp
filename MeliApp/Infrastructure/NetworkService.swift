//
//  NetworkService.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 25/11/21.
//

import Alamofire

class NetworkService {
    static let shared = NetworkService()

    fileprivate var helper: NetworkImplementation?
    fileprivate var network:Session?
    /**
     * Using the implementation to consume an service.
     *
     * - Parameters:
     *      - request: Request data.
     *      - success: Success callback of the service.
     *      - error: Error callback of the service.
     *      - showError: If this value is true, the error of the service will be showed at the current view controller.
     */
    func consumeWebService<T:Codable>(request: MeliModel.Request,
                                      type:T.Type,
                           success: @escaping SuccessCallback, error: ErrorCallback? = nil) {
        let meliManager = getNetwork()
        
        self.helper = NetworkImplementation(meliManager!, request: request, type: type)
        self.helper?.consume(success: success, error: error, type: type)
    }
        
    private func getNetwork() -> Session? {
        if (self.network == nil) {
            self.network = AF
        }
        return self.network
    }
}

