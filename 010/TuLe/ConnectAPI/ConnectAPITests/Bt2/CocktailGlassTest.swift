//
//  CocktailGlassTest.swift
//  ConnectAPITests
//
//  Created by Tu Le C. [2] VN.Danang on 29/06/2023.
//

import XCTest
@testable import ConnectAPI
import ViewInspector

final class CocktailGlassTest: XCTestCase {
    
    var sut: CocktailGlassViewModel!

    override func setUpWithError() throws {
        super.setUp()
        let mockAPI = Mock()
        sut = CocktailGlassViewModel(getApi: mockAPI)
    }

    override func tearDownWithError() throws {
        sut = nil
        super.tearDown()
    }
    
    func testApiError() throws {
        let mockFail = MockFailure()
        mockFail.shouldFail = true
        sut = CocktailGlassViewModel(getApi: mockFail)
        let expectation = XCTestExpectation(description: "Completion called with error")
        sut.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass")
        XCTAssertTrue(sut.data.cocktail.isEmpty)
    }
    
    func testTapButton() throws {
        var view = CocktailGlassView(viewModel: self.sut)
        let expectation = XCTestExpectation(description: "Button Tapped")
        let exp = view.on(\.didAppear) { view in
            try view.find(button: "LoadApi").tap()
            self.sut.callApi(urlString: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?g=Cocktail_glass")
        }
        ViewHosting.host(view: view)
        wait(for: [exp], timeout: 3)
        XCTAssertFalse(sut.data.cocktail.isEmpty)
        let scroll = try view.inspect().scrollView()
        let cell = try scroll.find(ViewType.LazyVGrid.self).forEach(0)
        XCTAssertFalse(cell.isEmpty)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
