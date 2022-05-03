//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by brian은석 on 2022/05/01.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
<<<<<<< HEAD
    let inputView = InputView()
    
    func test_0_유효하지않음에러() {
        do {
            let _ = try inputView.isValidNumber(0)
        } catch {
            if let error = error as? InputError {
                XCTAssert(error == InputError.invalidNumber, error.errorDescription)
            }
        }
    }
    
    func test_음수_유효하지않음에러() {
        do {
            let _ = try inputView.isValidNumber(-3)
        } catch {
            if let error = error as? InputError {
                XCTAssert(error == InputError.invalidNumber, error.errorDescription)
            }
        }
    }

    func test_게임룰_첫번째라운드_무조건플러스1() {
        XCTAssert(GameGuide.rule(1) == 1, "첫번째 라운드는 무조건 플러스 1 에러입니다.")
=======

    func test1쉼표2분리() throws {
        let split = Splitter()
        let test = split.targetWithComma("1,2")
        let result = ["1","2"]
        XCTAssert(test == result , "1,2 는 [1,2] 실패")
>>>>>>> a694801 (feat: Make stringCalculator)
    }
    
    
}


