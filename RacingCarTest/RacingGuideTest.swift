//
//  RacingGuideTest.swift
//  RacingCarTest
//
//  Created by brian은석 on 2022/05/06.
//

import XCTest
@testable import RacingCar


class RacingGuideTest: XCTestCase {
    private var carName = ""
    
    func test_게임룰_숫자_5_입력시_플러스1_성공() {
        let value: Int = GameRule.numberFourOrMorePlusOneOtherWisePlusZero(5)
        XCTAssert(value == 1, "게임 숫자 5입력시 잘못된 결과")
    }
    
    func test_게임룰_숫자_3_입력시_0_성공() {
        let value: Int = GameRule.numberFourOrMorePlusOneOtherWisePlusZero(3)
        XCTAssert(value == 0, "게임 숫자 3입력시 잘못된 결과")

    }
    
    func test_빈칸_입력시_빈값배열_성공() {
        let array: [String] = GameRule.splitComma("")
        XCTAssert(array == [""],"빈 값 배열이 안만들어짐")
    }
    
    func test_중간에_빈칸_입력시_중간에_빈값_성공() {
        let array: [String] = GameRule.splitComma("abc,,d")
        XCTAssert(array == ["abc","","d"],"중간에 빈 값 배열이 안만들어짐")
    }
        
    func test_자동차_이름_없으면_에러() {
        carNameInput("")
        do {
            let _ = try GameRule.validCheck(carName)
        } catch {
            if let error = error as? InputError {
                XCTAssert(error == InputError.emptyName)
            }
        }
    }
    
    func test_자동차_이름_다섯글자_성공() {
        carNameInput("abcde")

        let result = try? GameRule.validCheck(carName)
        XCTAssert(result == true)
    }

    func test_자동차_이름_여섯글자_에러() {
        carNameInput("abcdef")
        do {
            let _ = try GameRule.validCheck(carName)
        } catch {
            if let error = error as? InputError {
                XCTAssert(error == InputError.overCountNameLength)
            }
        }
    }
    
    func carNameInput(_ name: String) {
        carName = name
    }
}

