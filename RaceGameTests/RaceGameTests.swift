//
//  RaceGameTests.swift
//  RaceGameTests
//
//  Created by jinho jeong on 2022/04/29.
//

import XCTest
@testable import RacingCar

class RaceGameTests: XCTestCase {

    
    var sut: RacingGame!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
      //  sut = RacingGame(inputView: RacingGameInputView(), resultView: RacingGameResultView())
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_input_randomRange_0_between_9 () {
        //given
        let randomGenerator = RandomGenerator()
        let inputView = RacingGameInputView(randoGenerator: randomGenerator)
        let resultView = RacingGameResultView()
       
        
        sut = RacingGame(inputView: inputView, resultView: resultView)
        //when
        for _ in 0..<50 {
            let randomInteger = randomGenerator.random()
            print("randomInteger: \(randomInteger)")
            //then
            let expectation = 0..<10
            XCTAssertTrue(expectation.contains(randomInteger))
        }
    }
    
    func test_car_movePoint_lessThanOrEqual_gameCount() throws {
        //given
        let gameCount = 3
        let carCount = 3
        let randomGenerator = RandomGenerator()
        let gameSetting = GameSetting(gameCount: gameCount, carCount: carCount, randomGenerator: randomGenerator)
        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resultView = RacingGameResultView()
        
        sut = RacingGame(inputView: inputView, resultView: resultView)
        //when
        try sut.gameStart()
        
        //then
        sut.cars.forEach { car in
            XCTAssertLessThanOrEqual(car.movePoint, gameCount)
        }
    }
    
    func test_moveAndPause_by_minimumCondition() {
        
        let randomGenerator = RandomGenerator(range: 0..<5, minimuCondition: 5)
        let car = Car(randomGenerator: randomGenerator)
        car.move()
    
        XCTAssertEqual(car.movePoint, 0)
        
    }
}
