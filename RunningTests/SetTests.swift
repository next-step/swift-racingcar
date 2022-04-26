//
//  SetTests.swift
//  RunningTests
//
//  Created by ycsong on 2022/04/25.
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
        numbers.removeAll()
    }

    func testSetCount() throws {
        print("Set Count : \(numbers.count)")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
