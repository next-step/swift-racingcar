//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by sangsun on 2021/10/27.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {

    /// 자동차가 사용자가 입력한 만큼 생성되는지 테스트
    func test_generate_car_count_by_inputs() throws {
        var racingCar = RacingCar()
        let inputValue = 10
        racingCar.genereteCar(input: inputValue)
        
        XCTAssertEqual(racingCar.cars?.count, inputValue)
    }
}
