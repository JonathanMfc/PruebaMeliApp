//
//  HomePresenterTest.swift
//  MeliAppTests
//
//  Created by Jonathan Andres Castillo Baron on 26/11/21.
//

import UIKit
import XCTest
@testable import MeliApp

class HomePresenterTest: XCTestCase {

    var presenter: IHomePresenter?
   

    override func setUpWithError() throws {
        viewControllerMock = HomeViewControllerMock()
        presenter = HomePresenter(view: viewControllerMock)
        
    }

    override func tearDownWithError() throws {
        presenter = nil
        viewControllerMock = nil
    }

    func testGetCategoriesSuccess() throws {
        let cat = [Category(name: "Cat 1", id: "cat01")]
        presenter?.loadData(data: cat)
    }
    
    

}

