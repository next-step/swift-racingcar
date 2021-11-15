//
//  RefereeTest.swift
//  RacingCarTest
//
//  Created by Ppop on 2021/11/15.
//

import XCTest

class RefereeTest: XCTestCase {
    var refree: RefereeProtocol!
    
    override func setUpWithError() throws {
        refree = Referee()
    }
    
    override func tearDownWithError() throws {
        refree = nil
    }
    
    func test_Judge_True() {
        let value = 3
        var result: Bool = false
        let exceptation = XCTestExpectation(description: "Judge Exceptation")
        
        refree.judge(value) { bool in
            result = bool
            exceptation.fulfill()
        }
        
        XCTAssertTrue(result)
    }
    
    func test_Judge_False() {
        let value = 5
        var result: Bool = false
        let exceptation = XCTestExpectation(description: "Judge Exceptation")
        
        refree.judge(value) { bool in
            result = bool
            exceptation.fulfill()
        }
        
        XCTAssertFalse(result)
    }
}
