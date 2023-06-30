//
//  Exercise2Tests.swift
//  Exercise2Tests
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 29/06/2023.
//

import XCTest
import ViewInspector
@testable import Exercise2

final class Exercise2Tests: XCTestCase {

    private struct Constants {
        static let correctButtonTitle = "Tap me"
    }

    private var contentView: ContentView!

    override func setUpWithError() throws {
        contentView = ContentView(name: "")
    }

    override func tearDownWithError() throws {
        contentView = nil
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
