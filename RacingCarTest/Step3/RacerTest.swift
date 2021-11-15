//
//  RacerTest.swift
//  RacingCarTest
//
//  Created by Ppop on 2021/11/15.
//

import XCTest

class RacerTest: XCTestCase {
    var racer: RacerPtorocol!
    
    override func setUpWithError() throws {
        racer = Racer()
    }
    
    override func tearDownWithError() throws {
        racer = nil
    }
    
    func test_ThrowDice() {
        var result: Int?
        let exceptation = XCTestExpectation(description: "Dice Throw Exceptation")
        
        racer.throwDice { value in
            result = value
            exceptation.fulfill()
        }
        
        wait(for: [exceptation], timeout: 1.0)
        XCTAssertTrue((0...9).contains(result!))
    }
}
