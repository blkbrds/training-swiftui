//
//  Lesson2Tests.swift
//  Lesson2Tests
//
//  Created by Lam Le T. [2] VN.Danang on 6/30/23.
//

import XCTest
@testable import Lesson2
import SwiftUI
import ViewInspector

final class Lesson2Tests: XCTestCase {

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
    
    func testCheckTextTitle() throws {
        let myView = ContentView(name: "Light Mode")
        let textHello = try myView.inspect().find(text: "Hello, SwiftUI Lesson 2")
        let textHelloAgain = try myView.inspect().find(text: "Hello Again, SwiftUI Lesson 2")
        XCTAssertEqual(try textHello.string(), "Hello, SwiftUI Lesson 2")
        XCTAssertEqual(try textHelloAgain.string(), "Hello Again, SwiftUI Lesson 2")
    }

    func testCheckTitleButton() throws {
        let myView = ContentView(name: "")
        let enterInfoButton = try myView.inspect().find(text: "Tap Me Enter Info")
        XCTAssertEqual(try enterInfoButton.string(), "Tap Me Enter Info")
    }
    
    func testLightModeScreen() throws {
        let myView = ContentView(name: "Light Mode").environment(\.colorScheme, ColorScheme.light)
        let textHello = try myView.inspect().find(text: "Hello, SwiftUI Lesson 2")
        let textHelloAgain = try myView.inspect().find(text: "Hello Again, SwiftUI Lesson 2")
        XCTAssertEqual(ColorScheme.light, try textHello.environment(\.colorScheme))
        XCTAssertEqual(ColorScheme.light, try textHelloAgain.environment(\.colorScheme))
    }
    
    func testDarkModeScreen() throws {
        let myView = ContentView(name: "Dark Mode").environment(\.colorScheme, ColorScheme.dark)
        let textHello = try myView.inspect().find(text: "Hello, SwiftUI Lesson 2")
        let textHelloAgain = try myView.inspect().find(text: "Hello Again, SwiftUI Lesson 2")
        XCTAssertEqual(ColorScheme.dark, try textHello.environment(\.colorScheme))
        XCTAssertNotEqual(ColorScheme.dark, try textHelloAgain.environment(\.colorScheme))
    }
    
    func testShowAlertAfterTapButton() throws {
        var myView = ContentView(name: "Test Info")
        let exp = myView.on(\.didAppear) { view in
            let buttonEnterInfo = try view.find(button: "Tap Me Enter Info")
            XCTAssertFalse(try view.actualView().isShowAlert)
            try buttonEnterInfo.tap()
            XCTAssertTrue(try view.actualView().isShowAlert)
        }
        ViewHosting.host(view: myView)
        wait(for: [exp], timeout: 0.1)
    }
}
