//
//  ConnectAPITests.swift
//  ConnectAPITests
//
//  Created by Tu Le C. [2] VN.Danang on 19/06/2023.
//

import XCTest
@testable import ConnectAPI

final class ConnectAPITests: XCTestCase {
    
    var sut: NetworkingViewModel!

    override func setUpWithError() throws {
        super.setUp()
        let mockAPI = MockService()
        sut = NetworkingViewModel(getApi: mockAPI)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testAPISuccess() throws {
        let expectation = XCTestExpectation(description: "Completion called with success")
        sut.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
        XCTAssertFalse(sut.data.drinks.isEmpty)
    }
    
    func testAPIError() throws {
        let mockFail = MockFailureDogService()
        mockFail.shouldFail = true
        sut = NetworkingViewModel(getApi: mockFail)
        let expectation = XCTestExpectation(description: "Completion called with error")
        sut.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
        XCTAssertTrue(sut.data.drinks.isEmpty)
    }
}
