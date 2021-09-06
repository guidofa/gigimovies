//
//  GigimoviesTests.swift
//  GigimoviesTests
//
//  Created by Guido Fabio on 31/08/2021.
//

import XCTest
@testable import Gigimovies

class GigimoviesTests: XCTestCase {
    let correctSearchURL =  "https://api.themoviedb.org/3/search/movie?api_key=ef22fd117d94f612763fe8531e33f256&language=es&query=test"
    var popMoviesInteractor: PopMoviesInteractor?
    
    override func setUp() {
        super.setUp()
        popMoviesInteractor = PopMoviesInteractor()
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testUrl_shouldpassIfCorrectUrl() {
        XCTAssertTrue(correctSearchURL == URLHelper.getSearchUrl(query: "test"))
    }
    
    func testDataRetrivedFromServer() {
        popMoviesInteractor?.loadJson(fromURLString: URLHelper.getPopMoviesURL()) { (result) in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(Results.self, from: data)
                    XCTAssertNotNil(decodedData)
                } catch {
                    XCTFail()
                }
            case .failure(_):
                XCTFail()
            }
        }
    }
}
