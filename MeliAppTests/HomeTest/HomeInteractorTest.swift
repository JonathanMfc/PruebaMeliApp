//
//  HomeInteractor.swift
//  MeliAppTests
//
//  Created by Jonathan Andres Castillo Baron on 26/11/21.
//

import XCTest
@testable import MeliApp

class HomeInteractorTest: XCTestCase {

    var presenterMock: HomePresenterMock?
    var managerMock: HomeManagerMock?
    var interactor: IHomeInteractor?

    override func setUpWithError() throws {
        presenterMock = HomePresenterMock()
        managerMock = HomeManagerMock()
        interactor = HomeInteractor(presenter: presenterMock!,
                                    manager: managerMock!)
    }

    override func tearDownWithError() throws {
        presenterMock = nil
        managerMock = nil
    }

    func testGetCategoriesSuccess() throws {
        managerMock?.setIsError(false)
        interactor?.getCategories()
    }
    
    func testGetCategoriesFailure() throws {
        managerMock?.setIsError(true)
        interactor?.getCategories()
    }

    func testSearchProductsSuccess() throws {
        managerMock?.setIsError(false)
        interactor?.searchProducts(value: "Prod")
    }
    
    func testSearchProductsFailure() throws {
        managerMock?.setIsError(true)
        interactor?.searchProducts(value: "Prod")
    }

    func testSearchProductByCategorySuccess() throws {
        managerMock?.setIsError(false)
        interactor?.searchProductByCategory(id: "01")
    }
    
    func testSearchProductByCategoryFailure() throws {
        managerMock?.setIsError(true)
        interactor?.searchProductByCategory(id: "01")
    }

}
