//
//  StringCalculatorTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/28.
//

import XCTest

class StringCalculatorTests: XCTestCase {

    var sut: StringCalculator!
    
    override func setUpWithError() throws {
        sut = StringCalculator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_add_onePlusOne_resultInTwo() throws {
        // given
        let input = "1 + 1"
        
        // when
        let result = try sut.calculate(input)
        
        // then
        let expectation = 2
        XCTAssertEqual(result, expectation)
    }
    
    func test_subtract_oneMinusOne_resultInZero() throws {
        // given
        let input = "1 - 1"
        
        // when
        let result = try sut.calculate(input)
        
        // then
        let expectation = 0
        XCTAssertEqual(result, expectation)
    }
    
    func test_multiply_oneMultiplyOne_resultInOne() throws {
        //given
        let input = "1 * 1"
        
        // when
        let result = try sut.calculate(input)
        
        // then
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_divide_oneDivideByOne_resultInOne() throws {
        //given
        let input = "1 / 1"
        
        // when
        let result = try sut.calculate(input)
        
        // then
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_divide_oneDivideByZero_throwDivideByZero() throws {
        //given
        let input = "1 / 0"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.divideByZero
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_divide_oneDivideByTwo_throwResultInDouble() throws {
        //given
        let input = "1 / 2"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.resultInDouble
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_calculate_highOrderOperatorGivenLast_calculateInOrder() throws {
        // given
        let input = "2 + 3 * 4 / 2"
        
        // when
        let result = try sut.calculate(input)
        
        // then
        let expectation = 10
        XCTAssertEqual(result, expectation)
    }
    
    // MARK: - emptyArithmeticExpression
    
    func test_emptyInput_throwEmptyArithmeticExpression() throws {
        // given
        let input = ""
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.emptyArithmeticExpression
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_nilInput_throwEmptyArithmeticExpression() throws {
        //정상
        // given
        let input: String? = nil
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.emptyArithmeticExpression
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    // MARK: - containInvalidComponent
    
    func test_noSpaceAfterOperator_throwContainInvalidComponent() throws {
        // given
        let input = "1 +1"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.containInvalidComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_noSpaceBeforeOperator_throwContainInvalidComponent() throws {
        // given
        let input = "1+ 1"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.containInvalidComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_moreThanOneSpaceBetweenComponents_throwContainInvalidComponent() throws {
        // given
        let input = "1 +  1"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.containInvalidComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_endWithSpace_throwContainInvalidComponent() throws {
        // given
        let input = "1 + "
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.containInvalidComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_startWithSpace_throwContainInvalidComponent() throws {
        // given
        let input = " 1 + 1"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.containInvalidComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_containNeitherNumberNorOperator_throwContainInvalidComponent() throws {
        // given
        let input = "1 + 1 #"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.containInvalidComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    // MARK: - invalidOperand

    func test_operatorIsInOperandPosition_throwContainInvalidOperand() throws {
        // given
        let input = "1 1 +"

        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.invalidOperand
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }

    // MARK: - invalidOperator
    
    func test_operandIsInOperatorPosition_throwContainInvalidOperator() throws {
        // given
        let input = "1 1 1"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.invalidOperator
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    // MARK: - remainUncalculatedComponent
    
    func test_remainComponentsToCalculate_throwRemainUncalculatedComponent() throws {
        // given
        let input = "1 - 1 1"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.remainUncalculatedComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
    
    func test_notEnoughComponentsToCalculate_throwRemainUncalculatedComponent() throws {
        // given
        let input = "2 2"
        
        // when
        // then
        let expectation = StringCalculator.StringCalculatorError.remainUncalculatedComponent
        XCTAssertThrowsError(try sut.calculate(input)) { error in
            XCTAssertEqual(error as! StringCalculator.StringCalculatorError, expectation)
        }
    }
}

