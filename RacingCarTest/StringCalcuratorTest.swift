//
//  StringCalcuratorTest.swift
//  RacingCarTest
//
//  Created by 김효성 on 2021/10/31.
//

import XCTest
@testable import RacingCar

class StringCalcuratorTest: XCTestCase {
    var stringCalculator: StringCalculatorProtocol!
    
    override func setUpWithError() throws {
        let addCalculator: CalculatorProtocol = AddCalculator()
        let substractCalculator: CalculatorProtocol = SubstractCalculator()
        let multiplyCalculator: CalculatorProtocol = MultiplyCalculator()
        let devideCalculator: CalculatorProtocol = DevideCalculator()
        
        stringCalculator = StringCalculator(addCalculator: addCalculator,
                                            substractCalculator: substractCalculator,
                                            multiplyCalculator: multiplyCalculator,
                                            devideCalculator: devideCalculator)
    }
    
    override func tearDownWithError() throws {
        stringCalculator = nil
    }
    
    func test_Add() {
        let stringArithmeticOperation = "3 + 7 + 2"
        let result = 12
        
        XCTAssertEqual(try? stringCalculator.calculate(stringArithmeticOperation), result)
    }
    
    func test_substract() {
        let stringArithmeticOperation = "10 - 4 - 2"
        let result = 4
        
        XCTAssertEqual(try? stringCalculator.calculate(stringArithmeticOperation), result)
    }
    
    func test_mutiply() {
        let stringArithmeticOperation = "5 X 2 X 3"
        let result = 30
        
        XCTAssertEqual(try? stringCalculator.calculate(stringArithmeticOperation), result)
    }
    
    func test_devide() {
        let stringArithmeticOperation = "20 / 5 / 2"
        let result = 2
        
        XCTAssertEqual(try? stringCalculator.calculate(stringArithmeticOperation), result)
    }

    func test_inputError_nil() {
        let stringArithmeticOperation: String? = nil
        let result = StringCalculator.InputError.nil
        
        do {
            let _ = try stringCalculator.calculate(stringArithmeticOperation)
        } catch {
            XCTAssertEqual(error as? StringCalculator.InputError, result)
        }
    }
    
    func test_inputError_empty() {
        let stringArithmeticOperation: String? = ""
        let result = StringCalculator.InputError.empty
        
        do {
            let _ = try stringCalculator.calculate(stringArithmeticOperation)
        } catch {
            XCTAssertEqual(error as? StringCalculator.InputError, result)
        }
    }
    
    func test_inputError_Spacing() {
        let stringArithmeticOperation: String? = " "
        let result = StringCalculator.InputError.noNumbers
        
        do {
            let _ = try stringCalculator.calculate(stringArithmeticOperation)
        } catch {
            XCTAssertEqual(error as? StringCalculator.InputError, result)
        }
    }
    
    func test_inputError_noNumbers() {
        let stringArithmeticOperation: String? = "안녕"
        let result = StringCalculator.InputError.noNumbers
        
        do {
            let _ = try stringCalculator.calculate(stringArithmeticOperation)
        } catch {
            XCTAssertEqual(error as? StringCalculator.InputError, result)
        }
    }
    
    func test_inputError_noOperator() {
        let stringArithmeticOperation: String? = "1 * 2 & 3"
        let result = StringCalculator.InputError.noOperators
        
        do {
            let _ = try stringCalculator.calculate(stringArithmeticOperation)
        } catch {
            XCTAssertEqual(error as? StringCalculator.InputError, result)
        }
    }
}
