//
//  CompletionHandlingViewTest.swift
//  ConnectAPITests
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

@testable import ConnectAPI
import SwiftUI
import ViewInspector
import XCTest
import Combine

@MainActor class CompletionHandlingViewTest: XCTestCase {

    private var viewModel: CompletionHandlingViewModel!

    @MainActor override func setUp() {
        super.setUp()
        let mockApi = MockSuccessDrinkService()
        viewModel = CompletionHandlingViewModel(drinkService: mockApi)
    }

    func testSuccessListDrinks() throws {
        let view = CompletionHandlingView(viewModel: self.viewModel)
        try view.inspect().scrollView().lazyVGrid().callOnAppear()
        waitUntil(viewModel.$drinks, equals: DummyData.drinks)
        let sut = try view.inspect().scrollView().lazyVGrid().forEach(0)
        XCTAssertEqual(sut.count, viewModel.drinks.count)
        let cells = try view.inspect().findAll(DrinkItem.self)
        XCTAssertEqual(cells.count, DummyData.drinks.count)
    }
}
