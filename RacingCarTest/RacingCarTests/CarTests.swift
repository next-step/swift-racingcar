//
//  CarTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/04/28.
//

import XCTest

class CarTests: XCTestCase {
    
    func testGenerateRandomNumber() throws {
        XCTAssert((0...9).contains(Car(name: "test").generateRandomNumber()), "생성된 랜덤숫자가 범위를 벗어납니다.")
    }
    
    func testCarMove() throws {
        XCTAssertNoThrow(try? Car(name: "test").move(randomNumber: 4), "적절하지 않은 숫자가 입력됐습니다.")
    }
    
    func testCarNotMove() throws {
        XCTAssertNoThrow(try? Car(name: "test").move(randomNumber: 3), "적절하지 않은 숫자가 입력됐습니다.")
    }
    
    func test_차량_움직임_숫자가_범위를_벗어나는_숫자() throws {
        XCTAssertThrowsError(try Car(name: "test").move(randomNumber: 10),
                             "유효하지 않은 숫자입니다.") { error in
            guard let error = error as? RacingCarError else {
                fatalError("StringCalculatorError가 아닙니다.")
            }
            XCTAssert(error == .invalidNumber, "invalidError가 아닙니다.")
        }
    }
}
