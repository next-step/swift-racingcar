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
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_input_randomRange_0_between_9 () {
        //given
        let randomGenerator = RandomGenerator()
        let inputView = RacingGameInputView(randomGenerator: randomGenerator)
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
        try sut.gameReady()
        sut.gameStart()
        //then
        sut.cars.forEach { car in
            XCTAssertLessThanOrEqual(car.movePoint, gameCount)
        }
    }
    
    func test_moveAndPause_by_minimumCondition_In_Range() {
        
        //given
        let randomGenerator = RandomGenerator(range: 5..<10)
        let car = Car(randomGenerator: randomGenerator)
        car.minimumCondition = 3
        //when
        car.move()
        
        //then
        let expectation = 1
        XCTAssertEqual(car.movePoint, expectation)
    }
    
    func test_moveAndPause_by_minimumCondition_EscapingRange() {
        
        //given
        let randomGenerator = RandomGenerator(range: 5..<10)
        let car = Car(randomGenerator: randomGenerator)
        car.minimumCondition = 100
        //when
        car.move()
        
        //then
        let expectation = 0
        XCTAssertEqual(car.movePoint, expectation)
    }
    
    func test_inputView_correct_setting_gameSetting() throws {
        //given
        let randomGenerator = RandomGenerator(range: 0..<10)
        let gameCount = 5
        let carCount = 3
        let gameSetting = GameSetting(gameCount: gameCount, carCount: carCount, randomGenerator: randomGenerator)


        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resulView = RacingGameResultView()
        sut = RacingGame(inputView: inputView, resultView: resulView)

        //when
        try sut.gameReady()
        sut.gameStart()

        //then
        let result = sut.gameSetting
        XCTAssertEqual(result, gameSetting)
    }
    
    func test_inputView_correct_registerSetting_value() throws {
        //given
        let randomGenerator = RandomGenerator(range: 0..<10)
    
        let inputView = RacingGameInputView(randomGenerator: randomGenerator)
        let resulView = RacingGameResultView()
        sut = RacingGame(inputView: inputView, resultView: resulView)

        //when
        try sut.gameReady()
        
        //then
        let result = sut.gameSetting
        let expectation = inputView.registerSetting()
        XCTAssertEqual(result, expectation)
    }
    
    func test_inputView_validation_minus_value() throws {
        let randomGenerator = RandomGenerator(range: 0..<10)
        let gameSetting = GameSetting(gameCount: 5, carCount: 2, randomGenerator: randomGenerator)
        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resulView = RacingGameResultView()
        sut = RacingGame(inputView: inputView, resultView: resulView)

        //when && then
        let expectation = RacingGameInputViewMock.InputViewError.minusCount
        XCTAssertThrowsError(try sut.inputView.validation(count: "-5")) { error in
            XCTAssertEqual(error as? RacingGameInputViewMock.InputViewError, expectation)
        }
    }
    
    func test_inputView_validation_incorrectFormmat_value() throws {
        let randomGenerator = RandomGenerator(range: 0..<10)
        let gameSetting = GameSetting(gameCount: 5, carCount: 2, randomGenerator: randomGenerator)
        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resulView = RacingGameResultView()
        sut = RacingGame(inputView: inputView, resultView: resulView)
    
        //when &&then
        let expectation = RacingGameInputViewMock.InputViewError.incorrectFormat
        XCTAssertThrowsError(try sut.inputView.validation(count: "다섯")) { error in
            XCTAssertEqual(error as? RacingGameInputViewMock.InputViewError, expectation)
        }
    }
   
    func test_when자동차의이름_5자초과_thenTextLengthExceeded_Error발생하는지_체크() throws {
        
    }

    func test_given쉼표로구분된자동차들입력_when쉼표로분리_then문자열배열로나뉘는지_체크() {
        
    }

    func test_given공백이포함된자동차이름들_then공백제거_체크() {
        
    }

    func test_when레이스가끝난후_then포인트가가장높은차이름_출력_체크() {
        
    }
    
    func test_given동점인우승자가여럿_when레이스가끝난후_then동점인우승자들_출력_체크() {
        
    }
    
    func test_given모두포인드가0_when레이스가끝난후_then무효_출력_체크() {
        
    }
}
