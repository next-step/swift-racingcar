//
//  SetTests.swift
//  RacingCarTest
//
//  Created by brian은석 on 2022/04/26.
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
    
    func test총카운트3() {
        XCTAssertTrue(numbers.count == 3,"총갯수 3 실패")
    }


}
