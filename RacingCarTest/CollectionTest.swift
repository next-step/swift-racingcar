//
//  CollectionTest.swift
//  CollectionTest
//
//  Created by 카카오VX on 2022/04/25.
//

import XCTest

class CollectionTest: XCTestCase {
    private var numbers: Set<Int> = []
    
    override func setUpWithError() throws {
        numbers.removeAll()
        numbers.insert(1)
        numbers.insert(1)
        numbers.insert(2)
        numbers.insert(3)
    }

    override func tearDownWithError() throws {
        
    }
    
    func testCountSetNumbers() {
        XCTAssertEqual(numbers.count, 3)
    }

    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func testSplitString() {
        let splitedArray = splitString("1,2")
        
        XCTAssertEqual(splitedArray[0], "1")
        XCTAssertEqual(splitedArray[1], "2")
    }
    
    func testSplitWithoutSeparator() {
        let splitedArray = splitString("1")
        
        XCTAssertEqual(splitedArray[0], "1")
    }
}

private extension CollectionTest {
    func splitString(_ target: String) -> [String] {
        let stringWithBracketRemoved = target.replacingOccurrences(of: "()", with: "")
        return stringWithBracketRemoved.components(separatedBy: ",")
    }
}
