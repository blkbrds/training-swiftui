//
//  NetworkingViewModelTest.swift
//  ConnectAPITests
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

import Foundation
import XCTest
import SwiftUI
import Combine
@testable import ConnectAPI

@MainActor class NetworkingViewModelTest: XCTestCase {

    private var viewModel: NetworkingViewModel!

    @MainActor override func setUp() {
        super.setUp()
        let mockApi = MockSuccessDrinkService()
        viewModel = NetworkingViewModel(drinkService: mockApi)
    }

    func testSuccessGetDrink() {
        let expectation = XCTestExpectation(description: "Completion called with success")
        viewModel.fetchDrinks()
        waitUntil(viewModel.$drinks, equals: DummyData.dummyNameDrinks)
        XCTAssertEqual(self.viewModel.drinks.count, 2)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }

    func testFailureGetDrink() {
        let mockApi = MockFailureDrinkService()
        mockApi.shouldFail = true
        viewModel = NetworkingViewModel(drinkService: mockApi)
        let expectation = XCTestExpectation(description: "Completion called with error")
        viewModel.fetchDrinks()
        waitUntil(viewModel.$isShowError, equals: true)
        XCTAssertTrue(self.viewModel.isShowError)
        XCTAssertEqual(self.viewModel.errorString, Define.error)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
}

struct Define {
    static let error = "Fail in process get data"
}
struct DummyData {
    static let dummyNameDrinks = ["Margarita", "Blue Margarita"]
    static let drinks: [Drink] = [
        Drink(idDrink: "11007", name: "Margarita", image: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"),
        Drink(idDrink: "11118", name: "Blue Margarita", image: "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg")
    ]
}
