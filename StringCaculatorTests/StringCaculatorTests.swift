//
//  StringCaculatorTests.swift
//  StringCaculatorTests
//
//  Created by jinho jeong on 2022/04/25.
//

import XCTest
@testable import RacingCar

class StringCaculatorTests: XCTestCase {
    
    var sut: StringCaculator!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = StringCaculator()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
   
    //MARK: -BASIC TEST
    func test_plus_caculation() throws {
        //given
        let expression = "1 + 3"
        //when
        let result = try sut.caculate(expression: expression)
        //then
        let expectation = 4
        XCTAssertTrue(result == expectation)
    }
    
    func test_minus_caculation() throws {
        //given
        let expression = "1 - 3"
        //when
        let result = try sut.caculate(expression: expression)
        //then
        let expectation = -2
        XCTAssertTrue(result == expectation)
    }
    
    func test_multiply_caculation() throws {
        //given
        let expression = "1 * 3"
        //when
        let result = try sut.caculate(expression: expression)
        //then
        let expectation = 3
        XCTAssertTrue(result == expectation)
    }
    
    func test_divide_caculation() throws {
        //given
        let expression = "1 / 3"
        //when
        let result = try sut.caculate(expression: expression)
        //then
        let expectation = 0
        XCTAssertTrue(result == expectation)
    }
    
    //MARK: - SPECIAL TEST
    func test_complexExpression_caculation() throws {
        
        //given
        let expression =  "3 / 2  + 3 * 2"

        //when
        let result = try sut.caculate(expression: expression)
        //then
        let expectation = 8
        XCTAssertTrue(result == expectation)
    }
    
    func test_monomialExpression_caculation() throws {
        
        //given
        let expression =  "25"

        //when
        let result = try sut.caculate(expression: expression)
        //then
        let expectation = 25
        XCTAssertTrue(result == expectation)
    }
    
    //MARK: -THROW TEST
    func test_plusSign_monomialExpression_throw_notComputationOperand() throws {
        
        //given
        let expression =  "+3"
        
        //when && then
        let expectation = StringCaculator.StringCaculatorErrorType.incorrectExpression
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_minusSign_monomialExpression_throw_notComputationOperand() throws {
        
        //given
        let expression =  "-6"

        //when
        let expectation = StringCaculator.StringCaculatorErrorType.incorrectExpression
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_multiplySign_monomialExpression_throw_notComputationOperand() throws {
        
        //given
        let expression =  "*6"

        //when
        let expectation = StringCaculator.StringCaculatorErrorType.incorrectExpression
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_notNumber_complexExpression_throw_notComputationOperand() throws {
        
        //given
        let expression =  "2 * pi * r"

        //when
        let expectation = StringCaculator.StringCaculatorErrorType.incorrectExpression
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_divideByZero_throw_divideByZero() throws {
        //given
        let expression = "3 / 0"

        //when && then
        let expectation = StringCaculator.StringCaculatorErrorType.divideByZero
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_emptyExpression_throw_inputEmptyError() {
        
        let expression = ""

        //when && then
        let expectation = StringCaculator.StringCaculatorErrorType.inputEmptyError
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_SpaceExpression_throw_inputEmptyError() {
        
        let expression = " "

        //when && then
        let expectation = StringCaculator.StringCaculatorErrorType.inputEmptyError
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_monomialExpression_throw_incorrectExpression() throws {
        let expression = "+ 3"
        
        //when && then
        let expectation = StringCaculator.StringCaculatorErrorType.incorrectExpression
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_notExistOperator_throw_notComputationOperator() throws {
        let expression = "4 9"
        
        //when && then
        let expectation = StringCaculator.StringCaculatorErrorType.notComputationOperator
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
    
    func test_onlyExistOperator_throw_incorrectExpression() throws {
        let expression = "+"
        
        //when && then
        let expectation = StringCaculator.StringCaculatorErrorType.incorrectExpression
        XCTAssertThrowsError(try sut.caculate(expression: expression)) { error in
            XCTAssertEqual(error as? StringCaculator.StringCaculatorErrorType, expectation)
        }
    }
}
