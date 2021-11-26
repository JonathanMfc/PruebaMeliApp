//
//  MeliModel.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 25/11/21.
//

import Alamofire

struct MeliModel {
    struct Request {
        var method: HTTPMethod
        var url: String
        var requestBody: [String: Any] = [:]
        
        init(method: HTTPMethod,
             url: String,
             requestBody: [String: Any] = [:]) {
            self.method = method
            self.url = Configuration.getConfiguration(ConfigurationKey.baseURL) + url
            self.requestBody = requestBody
        }
    }
    
    enum ErrorCode: Int, Codable {
        case success = 0
        case generalError = -1
    }
    
    struct BaseResponse {
        var statusCode: MeliModel.ErrorCode?
        var serviceName: String?
        var message: String?
        var response: [String: Any]?
        
        init(data: [String: Any], statusCode :ErrorCode = .success) {
            self.response = data
            self.statusCode = statusCode
            getData(data: data)
        }
                
        private mutating func getData(data: [AnyHashable: Any]) {
            if let errCode = data["statusCode"] as? String, let statusCode = Int(errCode) {
                self.statusCode = MeliModel.ErrorCode(rawValue: statusCode)
            } else {
                self.statusCode = .generalError
            }
            
            if let serviceName = data["serviceName"] as? String {
                self.serviceName = serviceName
            }
            
            if let message = data["message"] as? String {
                self.message = message
            }
        }
    }
    struct BaseError {
        var description:String?
        var statusCode:ErrorCode?
        
        init(description:String = "Error, intente mas tarde.", statusCode: ErrorCode) {
            self.description = description
            self.statusCode = statusCode
        }
    }
}
