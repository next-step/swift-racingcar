//
//  InputCheckerTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest

class InputCheckerTest: XCTestCase {

    func test_roundCount를_체크할때_음의정수가_입력으로_들어오면_false를_리턴한다() {
        // given
        let negativeNumber = -1
        
        // when
        let result = InputChecker.isValidRoundCount(negativeNumber)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_roundCount를_체크할때_nil이_입력으로_들어오면_false를_리턴한다() {
        // given
        let nilRoundCount: Int? = nil
        
        // when
        let result = InputChecker.isValidRoundCount(nilRoundCount)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_roundCount를_체크할때_양의정수가_입력으로_들어오면_true를_리턴한다() {
        let positiveNumber: Int = 1
        
        // when
        let result = InputChecker.isValidCarCount(positiveNumber)
        
        // then
        XCTAssertTrue(result)
    }
    
    func test_carCount를_체크할때_음의정수가_입력으로_들어오면_false를_리턴한다() {
        // given
        let negativeNumber = -1
        
        // when
        let result = InputChecker.isValidCarCount(negativeNumber)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_carCount를_체크할때_nil이_입력으로_들어오면_false를_리턴한다() {
        // given
        let nilCarCount: Int? = nil
        
        // when
        let result = InputChecker.isValidCarCount(nilCarCount)
        
        // then
        XCTAssertFalse(result)
    }
    
    func test_carCount를_체크할때_양의정수가_입력으로_들어오면_true를_리턴한다() {
        let positiveNumber: Int = 1
        
        // when
        let result = InputChecker.isValidCarCount(positiveNumber)
        
        // then
        XCTAssertTrue(result)
    }
}
