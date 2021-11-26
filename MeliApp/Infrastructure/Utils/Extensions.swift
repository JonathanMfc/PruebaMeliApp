//
//  Extensions.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 26/11/21.
//

import UIKit

extension Float {
    
    func moneyFormat() -> String {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        
        let price : Float = (self)
        if let priceValue = formatter.string(from: NSNumber(value: price)){
            return "\(priceValue)"
        }else{
            return ""
        }
    }
}
    
