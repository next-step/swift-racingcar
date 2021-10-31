//
//  StringValidationCheckerTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/10/31.
//

import XCTest
@testable import RacingCar

class StringValidationCheckerTest: XCTestCase {
    
    func test_noneHasOperator() {
        let checker = StringCalculatorVaildationChecker(userInput: "1 2 3 4 5")
        XCTAssertEqual(checker.intAbleData, ["1", "3", "5"])
        XCTAssertEqual(checker.operatorbleData, ["2", "4"])
        XCTAssertEqual(checker.isHasValidationOperator(), false)
        XCTAssertEqual(checker.isHasIntAbleString(), true)
    }
    
    func test_hasOperator() {
        let checker = StringCalculatorVaildationChecker(userInput: "1 + 3 - 5")
        XCTAssertEqual(checker.intAbleData, ["1", "3", "5"])
        XCTAssertEqual(checker.operatorbleData, ["+", "-"])
        XCTAssertEqual(checker.isHasValidationOperator(), true)
        XCTAssertEqual(checker.isHasIntAbleString(), true)
    }
    
    func test_longUserInput() {
        let checker = StringCalculatorVaildationChecker(userInput: "1 * 4 / 4 * 10 + 1 + 2")
        XCTAssertEqual(checker.intAbleData, ["1", "4", "4", "10", "1", "2"])
        XCTAssertEqual(checker.operatorbleData, ["*", "/", "*", "+", "+"])
        XCTAssertEqual(checker.isHasValidationOperator(), true)
        XCTAssertEqual(checker.isHasIntAbleString(), true)
    }
}
