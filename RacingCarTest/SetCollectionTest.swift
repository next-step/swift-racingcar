//
//  SetCollectionTest.swift
//  RacingCarTest
//
//  Created by 조민호 on 2021/10/26.
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
    
    func test_Set의_개수가_3인가() throws {
        let testResultValue = numbers.count
        
        XCTAssertEqual(testResultValue, 3)
    }
}
