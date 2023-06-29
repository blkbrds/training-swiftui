//
//  CompletionHandlingViewModelTest.swift
//  ConnectAPITests
//
//  Created by Khuyen Dang T.T. VN.Danang on 29/06/2023.
//

import Foundation
import XCTest
import SwiftUI
import Combine
@testable import ConnectAPI

@MainActor class CompletionHandlingViewModelTest: XCTestCase {

    private var viewModel: CompletionHandlingViewModel!

    @MainActor override func setUp() {
        super.setUp()
        let mockApi = MockSuccessDrinkService()
        viewModel = CompletionHandlingViewModel(drinkService: mockApi)
    }

    func testSuccessGetDrink() {
        let expectation = XCTestExpectation(description: "Completion called with success")
        viewModel.getDrink()
        waitUntil(viewModel.$drinks, equals: DummyData.drinks)
        XCTAssertEqual(self.viewModel.drinks.count, 2)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }

    func testFailureGetDrink() {
        let mockApi = MockFailureDrinkService()
        mockApi.shouldFail = true
        viewModel = CompletionHandlingViewModel(drinkService: mockApi)
        let expectation = XCTestExpectation(description: "Completion called with error")
        viewModel.getDrink()
        waitUntil(viewModel.$isShowError, equals: true)
        XCTAssertTrue(self.viewModel.isShowError)
        XCTAssertEqual(self.viewModel.errorString, APIError.invalidResponse.localizedDescription)
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
}

// MOCK DATA
struct DummyData {
    static let drinks: [Drink] = [
        Drink(idDrink: "11007", name: "Margarita", image: "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg"),
        Drink(idDrink: "11118", name: "Blue Margarita", image: "https://www.thecocktaildb.com/images/media/drink/bry4qh1582751040.jpg")
    ]
}
