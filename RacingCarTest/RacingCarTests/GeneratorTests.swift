//
//  GeneratorTests.swift
//  RacingCarTest
//
//  Created by YooBin Jo on 2022/05/03.
//

import XCTest

class GeneratorTests: XCTestCase {
    
    func test_Generator가_랜덤숫자를_범위에_맞게_잘_생성하는지_테스트() throws {
        XCTAssert((0 ... 9).contains(Generator.generateRandomNumber()),
                  "생성한 랜덤 숫자가 범위를 벗어났습니다.")
    }
}
