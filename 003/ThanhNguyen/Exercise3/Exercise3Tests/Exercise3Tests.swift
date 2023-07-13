//
//  Exercise3Tests.swift
//  Exercise3Tests
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 03/07/2023.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Exercise3

final class Exercise3Tests: XCTestCase {

    private var loginView: LoginView!

    override func setUpWithError() throws {
        loginView = .init(email: "", password: "")
    }

    override func tearDownWithError() throws {
        loginView = nil
    }

    func testDisableSignInButton_emailAndPasswordEmpty() throws {
        loginView = .init(email: "", password: "")
        let button = try loginView.inspect().find(button: "Login")
        XCTAssertTrue(button.isDisabled())
    }

    func testDisableSignInButton_emailAndPasswordIncorrect() throws {
        loginView = .init(email: "thanh.nguyen4@monstar-lab", password: "abcd1234")
        let button = try loginView.inspect().find(button: "Login")
        XCTAssertTrue(button.isDisabled())
    }

    func testDisableSignInButton_emailCorrect_passwordIncorrect() throws {
        loginView = .init(email: "thanh.nguyen4@monstar-lab.com", password: "abcd1234")
        let button = try loginView.inspect().find(button: "Login")
        XCTAssertTrue(button.isDisabled())
    }

    func testDisableSignInButton_emailIncorrect_passwordCorrect() throws {
        loginView = .init(email: "thanh.nguyen4@monstar-lab", password: "@Abcd123")
        let button = try loginView.inspect().find(button: "Login")
        XCTAssertTrue(button.isDisabled())
    }

    func testEnableSignInButton() throws {
        loginView = .init(email: "thanh.nguyen4@monstar-lab.com", password: "@Abcd123")
        let button = try loginView.inspect().find(button: "Login")
        XCTAssertFalse(button.isDisabled())
    }

    func testClearAllText() throws {
        guard var loginView else { return }
        loginView = .init(email: "thanh123", password: "abcd1234")
        let expectation = loginView.on(\.didAppear) { view in
            let button = try view.find(button: "Forget password ?")
            try button.tap()
            XCTAssertTrue(try view.actualView().email.isEmpty)
            XCTAssertTrue(try view.actualView().password.isEmpty)
        }
        ViewHosting.host(view: loginView)
        wait(for: [expectation], timeout: 1)
    }
}
