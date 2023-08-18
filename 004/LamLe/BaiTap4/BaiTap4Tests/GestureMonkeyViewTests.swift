//
//  GestureMonkeyViewTests.swift
//  BaiTap4Tests
//
//  Created by Lam Le T. [2] VN.Danang on 8/8/23.
//

import XCTest
@testable import BaiTap4
import SwiftUI
import ViewInspector

final class GestureMonkeyViewTests: XCTestCase {

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
    
    func testMonkeyImageLongPressGesture() throws {
        let myView = GestureMonkeyView()
        let monkeyImage = try myView.inspect().find(viewWithTag: "ImageGesture")
        XCTAssertNoThrow(try monkeyImage.simultaneousGesture(LongPressGesture.self))
    }
    
    func testMonkeyImageDefaultLongPressGesture() throws {
        let myView = GestureMonkeyView()
        let monkeyImage = try myView.inspect().find(viewWithTag: "ImageGesture")
        try monkeyImage.simultaneousGesture(LongPressGesture.self)
        XCTAssertEqual(myView.scale, 1.0)
        XCTAssertEqual(myView.currentAmount, Angle.zero)
        XCTAssertEqual(myView.finalAmount, Angle.zero)
    }
}
