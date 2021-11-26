//
//  Product.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import Foundation

struct Product : Codable {
    var id : String?
    var site_id : String?
    var title : String?
    var price: Float?
    var currency_id : String?
    var available_quantity: Int?
    var sold_quantity: Int?
    var buying_mode : String?
    var listing_type_id : String?
    var stop_time : String?
    var condition : String?
    var permalink : String?
    var thumbnail : String?
    var thumbnail_id : String?
    var accepts_mercadopago: Bool?
    var installments : Installment?
    var attributes : [Attribute]?
    var original_price: Float?
    var category_id : String?
    var official_store_id: Int?
    var domain_id : String?
    var catalog_product_id : String?
    var catalog_listing: Bool?
    var order_backend: Int?
}
