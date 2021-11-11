//
//  RacingGameTest.swift
//  RacingCarTest
//
//  Created by 조민호 on 2021/11/04.
//

import XCTest

class RacingGameTest: XCTestCase {
    func test_입력값만큼_자동차를_생성한다() throws {
        let result = try CarsFactory().makeCars(nameOfCars: ["Mino", "Test", "Test"], numberOfCars: 3).count
        let expected = 3
        
        XCTAssertEqual(expected, result)
    }
    
    func test_입력값이_음수일경우_자동차를_생산하지않는다() {
        XCTAssertThrowsError(try CarsFactory().makeCars(nameOfCars: [], numberOfCars: -1)) { error in
            XCTAssertEqual(error as! CarsFactory.CarsFactoryError, CarsFactory.CarsFactoryError.notExistCar)
        }
    }
    
    func test_position값이_4_미만일경우_움직이지않는다() {
        let car = Car(name: "Mino")
        
        car.move(amount: 3)
        
        XCTAssertEqual(car.position, GameOption.defaultPosition)
    }
    
    func test_position값이_4_이상일경우_전진한다() {
        let car = Car(name: "Mino")
        
        car.move(amount: 4)
                
        XCTAssertEqual(car.position, GameOption.moveDistance)
    }
}

