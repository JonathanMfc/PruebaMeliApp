//
//  ApiEndpoint.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 25/11/21.
//

import Foundation

enum ApiEndpoint : String {
    case categories = "categories"
    case searchProduct = "/search?q="
    case searchProductByCategory = "/search?category="
}
