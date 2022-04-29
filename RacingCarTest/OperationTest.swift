//
//  OperationTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/29.
//

import XCTest
@testable import RacingCar

class OperationTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_Plus_operation은_두수를_더한값을_반환한다() {
        // given
        let plus = Plus()
        let lhs = -1
        let rhs = 10

        // when
        var result: Int?
        do {
            result = try plus.operate(lhs, rhs)
        } catch(let error) {
            XCTFail("plus 연산 과정에서 에러가 발생했습니다. \(error.localizedDescription)")
        }

        // then
        XCTAssertEqual(result, 9)
    }

    func test_Minus_operation은_두수를_뺀값을_반환한다() {
        // given
        let minus = Minus()
        let lhs = 2
        let rhs = 5

        // when
        var result: Int?
        do {
            result = try minus.operate(lhs, rhs)
        } catch(let error) {
            XCTFail("minus 연산 과정에서 에러가 발생했습니다. \(error.localizedDescription)")
        }

        // then
        XCTAssertEqual(result, -3)
    }

    func test_Multiplication_operation은_두개의_입력을_곱한값을_반환한다() {
        // given
        let multiplication = Multiplication()
        let lhs = -4
        let rhs = 5

        // when
        var result: Int?
        do {
            result = try multiplication.operate(lhs, rhs)
        } catch(let error) {
            XCTFail("multiplication 연산 과정에서 에러가 발생했습니다. \(error.localizedDescription)")
        }

        // then
        XCTAssertEqual(result, -20)
    }

    func test_Division_operation은_두개의_입력을_나눈값을_반환한다() {
        // given
        let division = Division()
        let lhs = -10
        let rhs = 5

        // when
        var result: Int?
        do {
            result = try division.operate(lhs, rhs)
        } catch(let error) {
            XCTFail("division 연산 과정에서 에러가 발생했습니다. \(error.localizedDescription)")
        }

        // then
        XCTAssertEqual(result, -2)
    }

}
