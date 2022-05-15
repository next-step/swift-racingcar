//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 김성준 on 2022/04/26.
//

import XCTest

/*
 주어진 횟수 동안 n대의 자동차는 전진 또는 멈출 수 있습니다.
 사용자는 몇 대의 자동차로 몇 번의 이동을 할 것인지를 입력할 수 있어야 합니다.
 전진하는 조건은 0에서 9 사이에서 무작위 값을 구한 후 무작위 값이 4 이상일 경우입니다.
 자동차의 상태를 화면에 출력합니다. 어느 시점에 출력할 것인지에 대한 제약은 없습니다.

 */
class RacingCarTest: XCTestCase {
    
    var fuel: Fuel!
    var car: Car!
    
    override func setUpWithError() throws {
        fuel = Fuel()
        car = Car()
    }
    
    override func tearDownWithError() throws {
        fuel = nil
        car = nil
    }
    
    //자동차의 moveDistance는 기본값 1이다.
    func test_자동차가_연료4를_받았을때_movedistance_5인지() {
        //given
        fuel.setLiter(4)
        
        //when
        car.moveFoward(fuel: fuel)
        
        //then
        XCTAssertEqual(car.moveDistance, 5)
    }
    
    func test_자동차가_연료3를_받았을때_movedistance_1인지() {
        //given
        fuel.setLiter(3)
        
        //when
        car.moveFoward(fuel: fuel)
        
        //then
        XCTAssertEqual(car.moveDistance, 1)
    }
    
    func test_입력받은_만큼_차가_만들어졌는지() {
        //given
        let input = 5
        
        //when
        let car = Car.generateCars(count: input)
        let racing = Racing(cars: car, moveCount: 0)
        
        //then
        XCTAssertEqual(racing.participatedCars().count, 5)
    }
    
    func test_자동차_3대_3번_움직이기시도() {
        let input = 3
        
        //when
        let car = Car.generateCars(count: input)
        let racing = Racing(cars: car, moveCount: 3)
        
        racing.start()
//        //then
//        XCTAssertEqual(racing.participatedCars().count, 5)
    }
}
