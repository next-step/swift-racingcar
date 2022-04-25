//
//  SetTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/25.
//

import XCTest

class SetTests: XCTestCase {
    
    private var numbers: Set<Int> = []

    override func setUpWithError() throws {
        numbers.removeAll()
        numbers.insert(1)
        numbers.insert(1)
        numbers.insert(2)
        numbers.insert(3)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckCountOfSet() throws {
        XCTAssertEqual(numbers.count, 3, "numbers의 원소의 개수는 3이 아니다.")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
