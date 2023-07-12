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
        loginView = .init(email: .constant(""), password: .constant(""))
    }

    override func tearDownWithError() throws {
        loginView = nil
    }

    func testDisableSignInButton() throws {
        loginView = .init(email: .constant(""), password: .constant(""))
        let button = try loginView.inspect().find(button: "Login")
        XCTAssertTrue(button.isDisabled())
    }

    func testEnableSignInButton() throws {
        loginView = .init(email: .constant("thanh123"), password: .constant("abcd1234"))
        let button = try loginView.inspect().find(button: "Login")
        XCTAssertFalse(button.isDisabled())
    }

    func testClearAllText() throws {
        guard var loginView else { return }
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
