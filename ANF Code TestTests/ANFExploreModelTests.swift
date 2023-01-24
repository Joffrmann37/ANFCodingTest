//
//  ANFExploreModel.swift
//  ANF Code TestTests
//
//  Created by Joffrey Mann on 1/24/23.
//

import XCTest
import Foundation
@testable import ANF_Code_Test

class ANFExploreModelTests: XCTestCase {
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

    func testImageDownload() {
        if let filePath = Bundle.main.path(forResource: "exploreData", ofType: "json"),
         let fileContent = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
            do {
                var models = try JSONDecoder().decode([ANFExploreModel].self, from: fileContent)
                models[0].setImageData { data in
                    XCTAssertNotNil(data)
                }
            } catch let error {
                print(error)
            }
        }
    }
}
