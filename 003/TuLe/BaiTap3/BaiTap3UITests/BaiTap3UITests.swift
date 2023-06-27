//
//  BaiTap3UITests.swift
//  BaiTap3UITests
//
//  Created by Tu Le C. [2] VN.Danang on 27/06/2023.
//

import XCTest
import SwiftUI
@testable import BaiTap3

final class BaiTap3UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        let avt = app.descendants(matching: .any)["AvatarView"]
        XCTAssertNotNil(avt)
        let image = app.images["no-avatar"]
        XCTAssertTrue(image.waitForExistence(timeout: 5.0))
        image.firstMatch.tap()
        sleep(1)
        
        for i in 0..<3 {
            let avtText1 = app.staticTexts["Tú \(i * 3 + 1)"]
            let avtText2 = app.staticTexts["Tú \(i * 3 + 2)"]
            let avtText3 = app.staticTexts["Tú \(i * 3 + 3)"]
            XCTAssertTrue(avtText1.exists)
            XCTAssertTrue(avtText2.exists)
            XCTAssertTrue(avtText3.exists)
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
