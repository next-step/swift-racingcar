//
//  CalculatorTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/29.
//

import XCTest
@testable import RacingCar


class CalculatorTest: XCTestCase {
    func test_calculate() {
        // given
        // 2 + 21 / 7 * 10
        let operands = [2, 21, 7, 10]
        let operations: [Operation] = [Plus(), Division(), Multiplication()]
        let calculator = Calculator()
        
        // when
        var result: Int?
        do {
            result = try calculator.calculate(operators: operations, operands: operands)
        } catch(let error) {
            XCTFail("연산 과정에서 에러가 발생했습니다. error: \(error.localizedDescription)")
        }
        
        
        // then
        XCTAssertEqual(result, 30)
    }
    
    func test_0으로나누는_연산식은_에러가발생한다() {
        // given
        // 2 + 21 / 0 * 10
        let operands = [2, 21, 0, 10]
        let operations: [Operation] = [Plus(), Division(), Multiplication()]
        let calculator = Calculator()
        
        // when
        // then
        XCTAssertThrowsError(try calculator.calculate(operators: operations, operands: operands))
    }
}
