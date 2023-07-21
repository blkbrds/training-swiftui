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
    
    func testUserNameFieldIsNotEmpty() throws {
            let loginView = LoginFormView()
            let textFieldUserName = try loginView.inspect().find(viewWithTag: "userNameTextField")
            XCTAssertFalse(textFieldUserName.isEmpty)
        }

    func testPasswordFieldIsNotEmpty() throws {
            let loginView = LoginFormView()
            let textFieldPassword = try loginView.inspect().find(viewWithTag: "passWordTextField")
            XCTAssertFalse(textFieldPassword.isEmpty)
    }

    func testButtonLoginIsNotDisable() throws {
            var loginView = LoginFormView()
            let exp = loginView.on(\.didAppear) { view in
                try view.actualView().userName = "Abcd"
                try view.actualView().passWord = "1234"
                let checkDisableButton = try view.actualView().validationTextField()
                XCTAssertFalse(checkDisableButton)
            }
        ViewHosting.host(view: loginView)
        wait(for: [exp], timeout: 0.1)
    }

    func testButtonLoginIsDisable() throws {
        var loginView = LoginFormView()
        let exp = loginView.on(\.didAppear) { view in
            try view.actualView().userName = ""
            try view.actualView().passWord = ""
            let checkDisableButton = try view.actualView().validationTextField()
            XCTAssertTrue(checkDisableButton)
        }
        ViewHosting.host(view: loginView)
        wait(for: [exp], timeout: 0.1)
    }

    //    func testLoginSuccess() throws {
    //        var loginView = LoginFormBaiTap9App()
    //        let exp = loginView.on(\.didAppear) { view in
    //            let buttonLogin = try view.find(button: "Log In")
    //            try view.actualView().userName = "Abcd"
    //            try view.actualView().passWord = "1234"
    //            try view.actualView().validationTextField()
    //            XCTAssertFalse(try view.actualView().loginSuccess)
    //            try buttonLogin.tap()
    //            XCTAssertTrue(try view.actualView().loginSuccess)
    //        }
    //        ViewHosting.host(view: loginView)
    //        wait(for: [exp], timeout: 0.1)
    //    }

}
