//
//  MySliderViewTests.swift
//  BaiTap4Tests
//
//  Created by Lam Le T. [2] VN.Danang on 8/8/23.
//

import XCTest
@testable import BaiTap4
import SwiftUI
import ViewInspector

final class MySliderViewTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSliderCanDragGesture() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            let textProcess = try view.find(viewWithTag: "process")
            XCTAssertNoThrow(try textProcess.gesture(DragGesture.self))
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderProgressWhenEnterTextField() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "69.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderProgress = try view.actualView().sliderProgress
            XCTAssertEqual(sliderProgress, 0.69)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderProgressNotEqualWhenEnterTextField() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "69.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderProgress = try view.actualView().sliderProgress
            XCTAssertNotEqual(sliderProgress, 0.96)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderProgressWhenEnterTextFieldBiggerOneHundred() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "123421.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderProgress = try view.actualView().sliderProgress
            XCTAssertEqual(sliderProgress, 1.00)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderHeightWhenEnterTextField() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "80.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderHeight = try view.actualView().sliderHeight
            XCTAssertEqual(sliderHeight, 40.0)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderHeightNotWhenEnterTextField() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "100.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderHeight = try view.actualView().sliderHeight
            XCTAssertNotEqual(sliderHeight, 40.0)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderHeightWhenEnterTextFieldBiggerOneHundred() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "12123.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderHeight = try view.actualView().sliderHeight
            XCTAssertEqual(sliderHeight, 50.0)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderHeightWhenEnterTextFieldSmallerZero() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "-12123.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderHeight = try view.actualView().sliderHeight
            XCTAssertEqual(sliderHeight, 0.0)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
    
    func testCheckSliderProgressWhenEnterTextFieldSmallerZero() throws {
        var myView = MySliderView()
        let exp = myView.on(\.didAppear) { view in
            var numberOfValueSlider = try view.actualView().numberValue
            numberOfValueSlider = "-123421.0"
            try view.actualView().handleSliderHeightProgress(numberValue: numberOfValueSlider, heightOfScreen: 100)
            let sliderProgress = try view.actualView().sliderProgress
            XCTAssertEqual(sliderProgress, 0)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
}
