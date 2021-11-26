//
//  HomeViewController.swift
//  MeliApp
//
//  Created by Jonathan Andres Castillo Baron on 22/11/21.
//

import UIKit

protocol IHomeViewController: class {
    var router: IHomeRouter? { get set }
    func getCategories()
    func loadCategories(categories:[Category])
    func goToProductsList(products: [Product])
    func showError()
}

class HomeViewController: BaseViewController {
    var interactor: IHomeInteractor?
    var router: IHomeRouter?
    var categories:[Category]? = []
    let nibCategoryCollectionViewCell = "CategoryCollectionViewCell"

    @IBOutlet weak var meliSearchBar: UISearchBar!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.register(UINib(nibName: nibCategoryCollectionViewCell, bundle: .main),
                                        forCellWithReuseIdentifier: nibCategoryCollectionViewCell)
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCategories()
    }

}

extension HomeViewController: IHomeViewController {
    func getCategories() {
        self.interactor?.getCategories()
    }
    
    func loadCategories(categories: [Category]) {
        self.categories = categories
        categoriesCollectionView.reloadData()
    }
    
    func goToProductsList(products: [Product]) {
        self.removeLoading()
        self.router?.goToProductsList(products: products)
    }
    
    func showError() {
        self.removeLoading()
        self.router?.showError(title:"Meli", message:"Error, intente mas tarde")
    }
}

extension HomeViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let value = searchBar.text!
        if value != "" {
            self.showLoading()
            self.interactor?.searchProducts(value: value)
            self.dismissKeyboard()
        }
    }
}

extension HomeViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let category = self.categories![indexPath.row]

        showAlert(title: category.id!, message: category.name!)
    }
}

extension HomeViewController:UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories!.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nibCategoryCollectionViewCell,
                                                      for: indexPath) as? CategoryCollectionViewCell
        let category = self.categories![indexPath.row]
        cell?.setup(data: category)
        cell?.callbackClick = { category in
            self.showLoading()
            self.interactor?.searchProductByCategory(id: category.id!)
        }
        return cell!
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width)
        return CGSize(width: width, height: 40)
    }
}

