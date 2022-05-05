//
//  ValidatorTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/05/01.
//

import XCTest

class ValidatorTests: XCTestCase {
    
    func test_랜덤_숫자_체크가_잘_되는지_테스트() throws {
        XCTAssert(Validator.checkValidation(number: 9) == true, "유효하지 않은 숫자가 들어왔습니다.")
    }
    
    func test_사용자_입력값이_0_혹은_음수가_들어올때_통과되지_않는_것_테스트() throws {
        XCTAssert(Validator.checkValidation(count: 0) == false,
                             "사용자 입력값이 정상적으로 들어왔습니다.")
    }
    
    func test_차량_이름이_아무것도_안들어오는것을_판단할_수_있는지_테스트() throws {
        XCTAssert(Validator.checkValidation(names: []) == false,
                             "사용자 입력값이 정상적으로 들어왔습니다.")
    }
    
    func test_차량_이름이_정상적으로_들어오는것을_판단할_수_있는지_테스트() throws {
        XCTAssert(Validator.checkValidation(names: ["test", "test2", "test123"]) == false,
                             "사용자 입력값이 정상적으로 들어왔습니다.")
    }
}
