//
//  NetworkingViewTest.swift
//  ConnectAPITests
//
//  Created by Khuyen Dang T.T. VN.Danang on 04/07/2023.
//

@testable import ConnectAPI
import SwiftUI
import ViewInspector
import XCTest
import Combine


@MainActor class NetworkingViewTest: XCTestCase {

    var viewModel: NetworkingViewModel!

    func testSuccessListDrinks() throws {
        let mockApi = MockSuccessDrinkService()
        viewModel = NetworkingViewModel(drinkService: mockApi)
        let view = NetworkingView(viewModel: viewModel)
        try view.inspect().list().callOnAppear()
        waitUntil(viewModel.$drinks, equals: DummyData.dummyNameDrinks)
        let sut = try view.inspect().list().forEach(0)
        XCTAssertEqual(sut.count, viewModel.drinks.count)
        let textContent = try view.inspect().list().forEach(0).text(0).string()
        XCTAssertEqual(textContent, DummyData.dummyNameDrinks[0])
        let textContent1 = try view.inspect().list().forEach(0).text(1).string()
        XCTAssertEqual(textContent1, DummyData.dummyNameDrinks[1])
    }
}
