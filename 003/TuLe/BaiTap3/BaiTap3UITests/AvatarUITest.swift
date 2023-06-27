//
//  AvatarUITest.swift
//  BaiTap3UITests
//
//  Created by Tu Le C. [2] VN.Danang on 27/06/2023.
//

import XCTest

final class AvatarUITest: XCTestCase {

    func testExample() {
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
}
