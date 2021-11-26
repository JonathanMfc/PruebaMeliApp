//
//  ProductsCollectionViewCell.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit
import Kingfisher

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productAvailableQuantityLabel: UILabel!
    var product : Product?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(data:Product){
        self.product = data
        productNameLabel.text = data.title
        productPriceLabel.text = data.price?.moneyFormat()
        productAvailableQuantityLabel.text = "Cantidad disponible \(Int(data.available_quantity ?? 0))"
        productImageView.kf.indicatorType = .activity
        productImageView.kf.setImage(with: URL(string: data.thumbnail!))
    }

}
