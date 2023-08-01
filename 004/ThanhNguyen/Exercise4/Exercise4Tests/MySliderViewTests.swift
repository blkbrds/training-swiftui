//
//  MySliderViewTests.swift
//  Exercise4Tests
//
//  Created by Thanh Nguyen X. [4] VN.Danang on 25/07/2023.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Exercise4

final class MySliderViewTests: XCTestCase {

    private var mySliderView: MySliderView!

    override func setUpWithError() throws {
        mySliderView = .init()
    }

    override func tearDownWithError() throws {
        mySliderView = nil
    }

    func testSliderHeight_whenInputNumber() throws {
        mySliderView = .init(value: 50)
        let customSlider = try mySliderView.inspect().find(CustomSlider.self)
        /// `Full slider height` = `300`
        /// `Input` `50%`
        /// `Test case:` `sliderHeight` = `150`
        XCTAssertEqual(try customSlider.actualView().tempHeight, 150)
    }

    func testPercentage_whenDragTheSlider() throws {
        mySliderView = .init(value: 50)
        let customTextField = try mySliderView.inspect().find(CustomTextField.self)
        XCTAssertEqual(try customTextField.actualView().value, 50)
    }

    func testPercentage_whenInputNegativeNumber() throws {
        var customTextField: CustomTextField = .init(value: .constant(-100))
        let expectation = customTextField.on(\.didAppear) { view in
            let button = try view.find(button: "Change text test")
            try button.tap()
            XCTAssertEqual(try view.actualView().testValue, 0)
        }
        ViewHosting.host(view: customTextField)
        wait(for: [expectation], timeout: 1)
    }

    func testPercentage_whenInputOverMaxNumber() throws {
        var customTextField: CustomTextField = .init(value: .constant(999))
        let expectation = customTextField.on(\.didAppear) { view in
            let button = try view.find(button: "Change text test")
            try button.tap()
            XCTAssertEqual(try view.actualView().testValue, 100)
        }
        ViewHosting.host(view: customTextField)
        wait(for: [expectation], timeout: 1)
    }
}

