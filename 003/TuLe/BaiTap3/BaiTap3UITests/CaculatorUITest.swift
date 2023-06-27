//
//  CaculatorUITest.swift
//  BaiTap3UITests
//
//  Created by Tu Le C. [2] VN.Danang on 27/06/2023.
//

import XCTest

final class CaculatorUITest: XCTestCase {
    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let displayText = app.staticTexts["0"]
        XCTAssertTrue(displayText.waitForExistence(timeout: 5.0))
        
        let inputButtons = app.buttons.allElementsBoundByIndex
        XCTAssertEqual(inputButtons.count, 19)
        inputButtons.first?.tap()
    }
}
