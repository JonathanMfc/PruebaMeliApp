//
//  Installment.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import Foundation

struct Installment : Codable {
    var quantity : Int?
    var amount : Float?
    var rate : Float?
    var currency_id : String?
}
