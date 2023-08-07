//
//  BaiTap3Tests.swift
//  BaiTap3Tests
//
//  Created by Lam Le T. [2] VN.Danang on 7/21/23.
//

import XCTest
@testable import BaiTap3

import SwiftUI
import ViewInspector

final class BaiTap3Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEmailTextFieldIsNotEmpty() throws {
        let loginView = LoginFormView()
        var email = loginView.viewModel.email
        email = "abcd"
        XCTAssertFalse(email.isEmpty)
    }
    
    func testEmailTextFieldIsEmpty() throws {
        let loginView = LoginFormView()
        var email = loginView.viewModel.email
        XCTAssertTrue(email.isEmpty)
    }

    func testPasswordFieldIsNotEmpty() throws {
        let loginView = LoginFormView()
        var password = loginView.viewModel.password
        password = "AQWER1234"
        XCTAssertFalse(password.isEmpty)
    }
    
    func testPasswordFieldIsEmpty() throws {
        let loginView = LoginFormView()
        let password = loginView.viewModel.password
        XCTAssertTrue(password.isEmpty)
    }
    
    func testEmailTextFieldIsInValid() throws {
        let loginView = LoginFormView()
        let viewModel = loginView.viewModel
        XCTAssertFalse(viewModel.isValidEmail("abcd@"))
    }
    
    func testEmailTestFieldIsValid() throws {
        let loginView = LoginFormView()
        let viewModel = loginView.viewModel
        XCTAssertTrue(viewModel.isValidEmail("LamLe96@gmail.co"))
    }
    
    func testPasswordTestFieldIsInValid() throws {
        let loginView = LoginFormView()
        let viewModel = loginView.viewModel
        XCTAssertFalse(viewModel.isValidPassword("abcd1234"))
    }
    
    func testPasswordTestFieldIsValid() throws {
        let loginView = LoginFormView()
        let viewModel = loginView.viewModel
        XCTAssertTrue(viewModel.isValidPassword("Lam12$asdd"))
    }

    func testButtonLoginIsNotDisable() throws {
        let loginView = LoginFormView()
        let vm = loginView.viewModel
        vm.email = "lam69@gmail.co"
        vm.password = "Admin@12345"
        XCTAssertFalse(vm.checkDisableLoginButton())
    }
    
    func testButtonLoginIsDisableWithNotEmptyTextField() throws {
        let loginView = LoginFormView()
        let vm = loginView.viewModel
        vm.email = "Abcd"
        vm.password = "1234"
        XCTAssertTrue(vm.checkDisableLoginButton())
    }

    func testButtonLoginIsDisableWithEmptyTextField() throws {
        let loginView = LoginFormView()
        let vm = loginView.viewModel
        vm.email = ""
        vm.password = ""
        XCTAssertTrue(vm.checkDisableLoginButton())
    }
}
