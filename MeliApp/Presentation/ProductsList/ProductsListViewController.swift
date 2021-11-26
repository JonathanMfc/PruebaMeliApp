//
//  ProductsListViewController.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IProductsListViewController: class {
    var router: IProductsListRouter? { get set }
    func loadProductsList(products:[Product])
    func goToProductDetail(product:Product)
}


class ProductsListViewController: UIViewController {

    var interactor: IProductsListInteractor?
    var router: IProductsListRouter?
    var productsList:[Product]? = []
    let nibProductsCollectionViewCell = "ProductsCollectionViewCell"

    @IBOutlet weak var productsCollectionVIew: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productsCollectionVIew.register(UINib(nibName: nibProductsCollectionViewCell, bundle: .main),
                                forCellWithReuseIdentifier: nibProductsCollectionViewCell)
        self.title = "Productos"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.interactor?.loadProductsList()
    }

}

extension ProductsListViewController: IProductsListViewController {
    func loadProductsList(products: [Product]) {
        self.productsList =  products
        productsCollectionVIew.reloadData()
    }
    
    func goToProductDetail(product: Product) {
        self.router?.goToProductDetail(product: product)
    }
}

extension ProductsListViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = productsList![indexPath.row]
        self.goToProductDetail(product: product)
    }
}

extension ProductsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibProductsCollectionViewCell,
                                                      for: indexPath) as? ProductsCollectionViewCell
        let product = self.productsList![indexPath.row]
        cell?.setup(data: product)
        return cell!
    }
}

extension ProductsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width)
        return CGSize(width: width, height: 200)
    }
}
