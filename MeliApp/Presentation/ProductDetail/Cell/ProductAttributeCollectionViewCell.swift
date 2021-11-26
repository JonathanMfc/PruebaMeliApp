//
//  ProductAttributeCollectionViewCell.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 26/11/21.
//

import UIKit

class ProductAttributeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productAttributeLabel: UILabel!
    var attribute : Attribute?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(data:Attribute){
        self.attribute = data
        productAttributeLabel.text = "\(data.name ?? ""): \(data.value_name ?? "")"
    }

}
