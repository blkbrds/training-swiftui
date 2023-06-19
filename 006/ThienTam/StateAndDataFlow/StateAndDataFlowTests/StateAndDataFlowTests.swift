//
//  StateAndDataFlowTests.swift
//  StateAndDataFlowTests
//
//  Created by Tam Nguyen K.T. [7] VN.Danang on 13/06/2023.
//

import XCTest
import Combine
import SwiftUI

@testable import StateAndDataFlow

@MainActor class LoginViewModelTest: XCTestCase {
    
    private var viewModel: LoginViewModel!
    
    @MainActor override func setUp() {
        super.setUp()
        viewModel = LoginViewModel()
    }
    
    func testValidSubmitButton() {
        viewModel.username = "user1"
        viewModel.password = "password123"
        XCTAssertTrue(viewModel.isLoginButtonEnabled)
        XCTAssertEqual(viewModel.titleButton, "GET STARTED")
        XCTAssertEqual(viewModel.colorButton, Color("submitButton"))
    }
    
    func testInvalidSubmitButton() {
        viewModel.username = "a"
        viewModel.password = "a"
        XCTAssertFalse(viewModel.isLoginButtonEnabled)
        XCTAssertEqual(viewModel.titleButton, "LOGIN")
        XCTAssertEqual(viewModel.colorButton, Color.gray.opacity(0.5))
        
    }
    
    func testLoginFailure() {
        viewModel.submitButton {
        }
        waitUntil(viewModel.$isShowAlert, equals: true)
        XCTAssertFalse(self.viewModel.isLoading)
        XCTAssertTrue(self.viewModel.isShowAlert)
    }
    
    func testLoginSuccess() {
        viewModel.username = "user1"
        viewModel.password = "password1"
        viewModel.submitButton {
        }
        waitUntil(viewModel.$isShowAlert, equals: false)
        XCTAssertFalse(self.viewModel.isShowAlert)
        
    }
}


extension XCTestCase {
    func waitUntil<T: Equatable>(
        _ propertyPublisher: Published<T>.Publisher,
        equals expectedValue: T,
        timeout: TimeInterval = 10,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let expectation = expectation(
            description: "Awaiting value \(expectedValue)"
        )
        
        var cancellable: AnyCancellable?

        cancellable = propertyPublisher
            .dropFirst()
            .first(where: { $0 == expectedValue })
            .sink { value in
                XCTAssertEqual(value, expectedValue, file: file, line: line)
                cancellable?.cancel()
                expectation.fulfill()
            }

        waitForExpectations(timeout: timeout, handler: nil)
    }
}
