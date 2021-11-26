//
//  HomePresenterMock.swift
//  MeliAppTests
//
//  Created by Jonathan Andres Castillo Baron on 26/11/21.
//

import Foundation
import XCTest
@testable import MeliApp

class HomePresenterMock: IHomePresenter {
    
    func loadCategories(categories: [MeliApp.Category]) {
        XCTAssert(categories.count == 2)
    }
    
    func loadProducts(products: [Product]) {
        assert(products.count == 2)
    }
    
    func showError() {
        assert(true)
    }
    
}
