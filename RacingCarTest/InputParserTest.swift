//
//  InputParserTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/29.
//

import XCTest
@testable import RacingCar

class InputParserTest: XCTestCase {
    func test_빈문자열을_파싱시도하면_inputIsEmpty에러가_발생한다() {
        // given
        let emptyString = ""

        // when
        // then
        XCTAssertThrowsError(try InputParser.parse(emptyString), "InputParser를 이용하여 문자열(문자열 내용: \(emptyString))을 파싱하는 과정에서 에러가 발생했습니다.") { error in
            XCTAssertEqual(error as? ParsingError, ParsingError.inputIsEmpty)
        }
    }

    func test_공백문자열을_파싱시도하면_inputIsBlank에러가_발생한다() {
        // given
        let blankSpace = " "

        // when
        // then
        XCTAssertThrowsError(try InputParser.parse(blankSpace), "InputParser를 이용하여 문자열(문자열 내용: \(blankSpace))을 파싱하는 과정에서 에러가 발생했습니다.") { error in
            XCTAssertEqual(error as? ParsingError, ParsingError.inputIsBlank)
        }
    }

    func test_nil을_파싱시도하면_inputIsNil에러가_발생한다() {
        // given
        let nilInput: String? = nil

        // when
        // then
        XCTAssertThrowsError(try InputParser.parse(nilInput)) { error in
            XCTAssertEqual(error as? ParsingError, ParsingError.inputIsNil)
        }
    }

    func test_올바른_계산식을_입력하면_NumericalExperession이_반환되고_NumericExperssion에는_계산식구성요소가_들어있다() {
        // given
        let numericExpression = "4 + 3 / 2 * 7"

        // when
        var result: ([Operation], [Int])?

        do  {
            result = try InputParser.parse(numericExpression)
        } catch(let error) {
            XCTFail("InputParser를 이용한 파싱과정에서 에러가 발생했습니다. error: \(error.localizedDescription)")
        }

        // then
        let operations = result?.0
        XCTAssert(operations?[0] is Plus)
        XCTAssert(operations?[1] is Division)
        XCTAssert(operations?[2] is Multiplication)

        let operands = result?.1
        XCTAssert(operands?[0] == 4)
        XCTAssert(operands?[1] == 3)
        XCTAssert(operands?[2] == 2)
        XCTAssert(operands?[3] == 7)
    }

    func test_피연산자가_부족한_연산식을_입력하면_insufficient에러가_발생한다() {

        // given
        let insufficientExpression = "4 +"

        // when
        // then
        XCTAssertThrowsError(try InputParser.parse(insufficientExpression)) { error in
            XCTAssertEqual(error as? ParsingError, ParsingError.insufficient)
        }
    }
}
