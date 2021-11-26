//
//  ProductsResponse.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import Foundation

struct ProductsResponse: Codable{
    var site_id : String?
    var results : [Product]
}
