//
//  FingerInteractionViewTests.swift
//  Exercise4Tests
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 25/07/2023.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Exercise4

final class FingerInteractionViewTests: XCTestCase {

    private var fingerInteractionView: FingerInteractionView!

    override func setUpWithError() throws {
        fingerInteractionView = .init(scale: 1, rotate: .zero)
    }

    override func tearDownWithError() throws {
        fingerInteractionView = nil
    }

    func testResetImageStatusToDefault_whenLongTap() throws {
        guard var fingerInteractionView else { return }
        fingerInteractionView = .init(scale: 2, rotate: .degrees(90))
        let expectation = fingerInteractionView.on(\.didAppear) { view in
            let button = try view.find(button: "Long Tap Test")
            try button.tap()
            XCTAssertEqual(try view.actualView().scale, 1)
            XCTAssertEqual(try view.actualView().rotate, .zero)
        }
        ViewHosting.host(view: fingerInteractionView)
        wait(for: [expectation], timeout: 1)
    }
}
