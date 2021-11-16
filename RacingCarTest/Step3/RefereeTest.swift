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
        
        result = refree.judge(value)
        
        XCTAssertTrue(result)
    }
    
    func test_Judge_False() {
        let value = 5
        var result: Bool = false
        
        result = refree.judge(value)
        
        XCTAssertFalse(result)
    }
}
