//
//  HelloSwiftUITests.swift
//  HelloSwiftUITests
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 27/06/2023.
//

import XCTest
import SwiftUI
import Combine
import ViewInspector
@testable import HelloSwiftUI

final class HelloSwiftUITests: XCTestCase {

    private struct Constants {
        static let correctButtonTitle = "Tap me"
    }

    private var contentView: ContentView!

    override func setUpWithError() throws {
        contentView = ContentView()
    }

    override func tearDownWithError() throws {
        contentView = nil
    }

    func testButtonTitle() throws {
        let buttonText = try contentView.inspect().find(button: Constants.correctButtonTitle).find(text: Constants.correctButtonTitle)
        XCTAssertEqual(try buttonText.string(), Constants.correctButtonTitle)
    }

    func testInitBackgroundColor() throws {
        XCTAssertEqual(Color.white, contentView.backgroundColor)
    }

    func testBackgroundColorAfterTap() throws {
        guard var contentView else { return }
        let expectation = contentView.on(\.didAppear) { view in
            let button = try view.find(button: Constants.correctButtonTitle)
            try button.tap()
            XCTAssertNotEqual(Color.white, try view.actualView().backgroundColor)
        }
        ViewHosting.host(view: contentView)
        wait(for: [expectation], timeout: 1)
    }
}
