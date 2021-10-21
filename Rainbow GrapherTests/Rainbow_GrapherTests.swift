//
//  Rainbow_GrapherTests.swift
//  Rainbow GrapherTests
//
//  Created by Sylvan Martin on 10/16/21.
//

import XCTest
@testable import Rainbow_Grapher

class Rainbow_GrapherTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let (xAxis, yAxis) = (Line<CGPoint>.horizontalAxis(width: 1), Line<CGPoint>.verticalAxis(width: 1))
        
        print("DONE INITIALIZING")
        for x in -10...10 {
            let point = CGPoint(x1: Double(x), x2: 0)
            assert(xAxis.contains(point))
        }
        
        for y in -10...10 {
            let point = CGPoint(x1: 0, x2: Double(y))
            assert(yAxis.contains(point))
        }
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
