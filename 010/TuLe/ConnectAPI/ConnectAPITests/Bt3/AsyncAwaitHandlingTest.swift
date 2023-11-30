//
//  AsyncAwaitHandlingTest.swift
//  ConnectAPITests
//
//  Created by Tu Le C. [2] VN.Danang on 10/07/2023.
//

import XCTest
@testable import ConnectAPI
import ViewInspector

final class AsyncAwaitHandlingTest: XCTestCase {
    
    var sut: AsyncAwaitHandlingViewModel!

    override func setUpWithError() throws {
        super.setUp()
        let mockAPI = MockBt3()
        sut = AsyncAwaitHandlingViewModel(getApi: mockAPI)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testApiError() async throws {
        let mockFail = Bt3MockFailure()
        mockFail.shouldFail = true
        sut = AsyncAwaitHandlingViewModel(getApi: mockFail)
        let expectation = XCTestExpectation(description: "Completion called with error")
        await sut.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass")
        XCTAssertTrue(sut.data.cocktail.isEmpty)
    }
    
    @MainActor func testTapButton() async throws {
        var view = AsyncAwaitHandlingView(viewModel: self.sut)
        let expectation = XCTestExpectation(description: "Button Tapped")
        let exp = view.on(\.didAppear) { view in
            try view.find(button: "LoadApi").tap()
        }
        await sut.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass")
        ViewHosting.host(view: view)
        wait(for: [exp], timeout: 3)
        XCTAssertFalse(sut.data.cocktail.isEmpty)
        let scroll = try view.inspect().scrollView()
        let cell = try scroll.find(ViewType.LazyVGrid.self).forEach(0)
        XCTAssertFalse(cell.isEmpty)
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

}
