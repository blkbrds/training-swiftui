//
//  HelloSwiftUITests.swift
//  HelloSwiftUITests
//
//  Created by Lam Le T. [2] VN.Danang on 6/26/23.
//
import XCTest
@testable import HelloSwiftUI
import SwiftUI
import ViewInspector

extension Bai1: Inspectable {}

final class HelloSwiftUITests: XCTestCase {

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

    func testTitleButton() throws {
        let bai1 = Bai1()
        let titleButton = try bai1.inspect()
            .find(button: "Tap")
        let textButton = try titleButton.find(text: "Tap")
        XCTAssertEqual(try textButton.string(), "Tap")
    }

    func testRandomColorTapping() throws {
        let viewModel = Bai1.ViewModel()
        viewModel.changeColorRandom()
        XCTAssertNotEqual(viewModel.randomColor, Color.gray)
    }
    
    func testBackGroupColorAfterTappingButton() throws {
        var bai1 = Bai1()
        let exp = bai1.on(\.didAppear) { view in
            let tapButton = try view.find(button: "Tap")
            try tapButton.tap()
            XCTAssertNotEqual(try view.actualView().viewModel.randomColor, Color.gray)
        }
        ViewHosting.host(view: bai1)
        wait(for: [exp], timeout: 0.1)
    }
}
