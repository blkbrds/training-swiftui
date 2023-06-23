//
//  ConnectUrlsApiViewModelTest.swift
//  ConnectAPITests
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 22/06/2023.
//

import XCTest
import SwiftUI
import Combine

@testable import ConnectAPI

@MainActor final class ConnectUrlsApiViewModelTest: XCTestCase {

    private var viewModel: ConnectUrlsApiViewModel!

    @MainActor override func setUp() {
        super.setUp()
        let mockAPI = MockDogService()
        viewModel = ConnectUrlsApiViewModel(dogService: mockAPI)
    }

    func testSuccessgetAnimals() {
        let expectation = XCTestExpectation(description: "Completion called with success")
        viewModel.getAnimals { items, errors in
            XCTAssertNil(errors)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }


    func testGetAnimalsFailure() {
        let mockDogService = MockFailureDogService()
        mockDogService.shouldFail = true

        viewModel = ConnectUrlsApiViewModel(dogService: mockDogService)

        let expectation = XCTestExpectation(description: "Completion called with error")

        viewModel.getAnimals { (animals, error) in
            XCTAssertNotNil(error)
            XCTAssertNil(animals)
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

}
