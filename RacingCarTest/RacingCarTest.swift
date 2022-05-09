//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by nylah.j on 2022/04/30.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
    func test_자동차가_움직이면_자동차의_위치가_1증가한다() {
        // given
        var racingCar = try! RacingCar(id: 0, name: "", engine: MovingEngine())
        let previousLocation = racingCar.location

        // when
        racingCar.move()
        
        // then
        XCTAssertEqual(racingCar.location, previousLocation + 1)
    }
    
    func test_자동차가_움직이지_않으면_자동차의_위치는_변경되지_않는다() {
        // given
        var racingCar = try! RacingCar(id: 0, name: "", engine: UnmovingEngine())
        let previousLocation = racingCar.location

        // when
        racingCar.move()
        
        // then
        XCTAssertEqual(racingCar.location, previousLocation)
    }

    func test_자동차는_5글자이하의_이름을_갖는다() {
        // given
        let fiveLetters = "12345"
        
        // when
        let racingCar = try! RacingCar(id:0, name: fiveLetters, engine: MovingEngine())

        // then
        XCTAssertEqual(racingCar.name, fiveLetters)
    }
    
    func test_자동차에_5글자를_초과하는_이름을_입력하면_에러가_발생한다() {
        // given
        let sixLetters = "123456"
        
        // when
        // then
        XCTAssertThrowsError(try RacingCar(id:0, name: sixLetters, engine: MovingEngine()))
    }
}
