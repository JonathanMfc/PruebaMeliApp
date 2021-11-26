//
//  CategoryCollectionViewCell.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    var category : Category?

    var callbackClick: ((Category) -> ())?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(data:Category){
        self.category = data
        categoryLabel.text = data.name
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        self.addGestureRecognizer(tap)

    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil)
    {
        callbackClick!(self.category!)
    }

}
