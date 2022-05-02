//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by brian은석 on 2022/04/26.
//

import XCTest
@testable import RacingCar

class Step1Test: XCTestCase {

    func test_입력문자_1쉼표2_쪼개면_배열_1과2() throws {
        let split = Splitter()
        let test = split.targetWithComma("1,2")
        let result = ["1","2"]
        XCTAssert(test == result , "1,2 는 [1,2] 실패")
    }
    
    func test_입력문자_1_쪼개면_배열_1() throws {
        let split = Splitter()

        XCTAssert(split.targetWithComma("1") == ["1"],"[1] 실패")
    }
    
    func test_입력문자_괄호1쉼표2_쪼개면_문자열_1쉼표2() throws {
        let split = Splitter()
        
        XCTAssert(split.targetWithBracketAndComma("(1,2)") == "1,2","1,2 결과 값 실패")
    }

}


