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
        
        XCTAssertEqual(result, expected)
    }
    
    func test_입력한_이름이_정상적으로_부여된채로_생성한다() throws {
        let result = try CarsFactory().makeCars(nameOfCars: ["Mino", "Test", "Test"], numberOfCars: 3)
        let expected = ["Mino", "Test", "Test"]
        
        XCTAssertEqual(result.map { $0.name }, expected)
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
    
    func test_자동차들의_position값의_최대값이_3인경우_3을_리턴한다() {
        let car1 = Car(name: "test1", position: "-")
        let car2 = Car(name: "test2", position: "--")
        let car3 = Car(name: "test3", position: "---")
        
        let result = RacingGame().findMaxPosition(cars: [car1, car2, car3])
        let expected = 3
        
        XCTAssertEqual(result, expected)
    }
}

