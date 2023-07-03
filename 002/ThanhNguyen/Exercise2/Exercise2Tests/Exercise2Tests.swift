//
//  Exercise2Tests.swift
//  Exercise2Tests
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/06/2023.
//

import SwiftUI
import XCTest
import ViewInspector
@testable import Exercise2

final class Exercise2Tests: XCTestCase {

    private struct Constants {
        static let correctButtonTitle = "Tap me"
    }

    private var contentView: ContentView!

    override func setUpWithError() throws {
        contentView = ContentView(name: .constant(""))
    }

    override func tearDownWithError() throws {
        contentView = nil
    }

    func testTitleLightScheme() throws {
        let contentView = ContentView(name: .constant("")).environment(\.colorScheme, .light)
        let text = try contentView.inspect().find(text: "Hello, world!")
        XCTAssertEqual(ColorScheme.light, try text.environment(\.colorScheme))
    }

    func testTitleDarkScheme() throws {
        let contentView = ContentView(name: .constant("")).environment(\.colorScheme, .dark)
        let text = try contentView.inspect().find(text: "Hello, world!")
        XCTAssertEqual(ColorScheme.dark, try text.environment(\.colorScheme))
    }

    func testAlwaysLightTextWhenLightEnvironment() throws {
        let contentView = ContentView(name: .constant("")).environment(\.colorScheme, .light)
        let text = try contentView.inspect().find(text: "Light mode always")
        XCTAssertEqual(ColorScheme.light, try text.environment(\.colorScheme))
    }

    func testAlwaysLightTextWhenDarkEnvironment() throws {
        let contentView = ContentView(name: .constant("")).environment(\.colorScheme, .dark)
        let text = try contentView.inspect().find(text: "Light mode always")
        XCTAssertEqual(ColorScheme.light, try text.environment(\.colorScheme))
    }

    func testShowAlert() throws {
        guard var contentView else { return }
        let expectation = contentView.on(\.didAppear) { view in
            let button = try view.find(button: Constants.correctButtonTitle)
            XCTAssertFalse(try view.actualView().shouldShowingAlert)
            try button.tap()
            XCTAssertTrue(try view.actualView().shouldShowingAlert)
        }
        ViewHosting.host(view: contentView)
        wait(for: [expectation], timeout: 1)
    }
}
