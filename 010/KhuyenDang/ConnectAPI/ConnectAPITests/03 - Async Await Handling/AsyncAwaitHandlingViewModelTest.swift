//
//  AsyncAwaitHandlingViewModelTest.swift
//  ConnectAPITests
//
//  Created by Khuyen Dang T.T. VN.Danang on 05/07/2023.
//

import Foundation
import XCTest
import SwiftUI
import Combine
@testable import ConnectAPI

@MainActor class AsyncAwaitHandlingViewModelTest: XCTestCase {
    
    private var viewModel: AsyncAwaitHandlingViewModel!
    
    @MainActor override func setUp() {
        super.setUp()
        let mockApi = MockSuccessDrinkService()
        viewModel = AsyncAwaitHandlingViewModel(drinkService: mockApi)
    }
    
    func testSuccessGetDrink() async {
        await viewModel.getDrinksWithAsync()
        XCTAssertEqual(viewModel.drinks, DummyData.drinks)
    }
    
    func testFailureGetDrink() async {
        let mockApi = MockFailureDrinkService()
        viewModel = AsyncAwaitHandlingViewModel(drinkService: mockApi)
        await viewModel.getDrinksWithAsync()
        XCTAssertTrue(viewModel.isShowError)
        XCTAssertNotNil(viewModel.isShowError)
    }
}
