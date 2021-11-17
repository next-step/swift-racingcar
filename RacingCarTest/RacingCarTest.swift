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
        
        XCTAssertEqual(racingCar.cars.count, inputValue)
    }
    
    /// 전진하는 조건에 따라 자동차가 움직였는지 테스트
    func test_car_is_not_move() throws {
        var car = Car()
        let rollNotCarMoved = 3
        car.move(judge: rollNotCarMoved)
        
        XCTAssertFalse(car.distance > 0)
    }
    
    func test_car_is_move() throws {
        var car = Car()
        let rollCarMove = 4
        car.move(judge: rollCarMove)
        
        XCTAssertTrue(car.distance > 0)
    }
}
