//
//  ProductDetailViewController.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit
import Kingfisher

protocol IProductDetailViewController: class {
    var router: IProductDetailRouter? { get set }
    func loadProduct(product:Product)
}

class ProductDetailViewController: UIViewController {
    var interactor: IProductDetailInteractor?
    var router: IProductDetailRouter?

    var link = ""
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productAttributeCollectionView: UICollectionView!
    var attributesList: [Attribute]? = []
    let nibProductAttributeCollectionViewCell = "ProductAttributeCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productAttributeCollectionView.register(UINib(nibName: nibProductAttributeCollectionViewCell, bundle: .main),
                                forCellWithReuseIdentifier: nibProductAttributeCollectionViewCell)
        self.title = "Detalle del Producto"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.loadProduct()
    }
    
    @IBAction func productLinkButtonPressed(_ sender: Any) {
        self.router?.goToProductLink(url: self.link)
    }

}

extension ProductDetailViewController: IProductDetailViewController {
    func loadProduct(product: Product) {
        
        productNameLabel.text = product.title
        productImageView.kf.indicatorType = .activity
        productImageView.kf.setImage(with: URL(string: product.thumbnail!))
        productPriceLabel.text = product.price?.moneyFormat()
        link = product.permalink!
        self.attributesList = product.attributes
        productAttributeCollectionView.reloadData()
    }
}

extension ProductDetailViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

extension ProductDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attributesList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibProductAttributeCollectionViewCell,
                                                      for: indexPath) as? ProductAttributeCollectionViewCell
        let attribute = self.attributesList![indexPath.row]
        cell?.setup(data: attribute)
        return cell!
    }
}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width)
        return CGSize(width: width, height: 40)
    }
}

