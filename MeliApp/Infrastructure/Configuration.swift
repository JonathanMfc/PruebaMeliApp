//
//  Configuration.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 25/11/21.
//

import Foundation

struct ConfigurationKey {
    static let baseURL = "BASE_URL"
}

class Configuration {
    static func getConfiguration(_ key: String) -> String {
        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource:  "MeliConfigurations", ofType: "plist"){
            nsDictionary = NSDictionary(contentsOfFile: path)
            if let value = nsDictionary?.object(forKey: key) as? String{
                return value
            }
        }
        return ""
    }
}
