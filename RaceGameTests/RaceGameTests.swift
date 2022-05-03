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
        let resultView = RacingGameResultViewMock()
       
        sut = RacingGame(inputView: inputView, resultView: resultView)
        //when
        for _ in 0..<50 {
            let randomInteger = randomGenerator.random()
            //then
            let expectation = 0..<10
            XCTAssertTrue(expectation.contains(randomInteger))
        }
    }
    
    func test_car_movePoint_lessThanOrEqual_gameCount() throws {
        //given
        let gameCount = 3
        let carNames = ["Tayo", "Sing"]
        let randomGenerator = RandomGenerator()
        let gameSetting = GameSetting(gameCount: gameCount, carNames: carNames, randomGenerator: randomGenerator)
        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resultView = RacingGameResultViewMock()
        
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
        let car = Car(name: "Tayo", randomGenerator: randomGenerator)
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
        let car = Car(name: "Tayo",randomGenerator: randomGenerator)
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
        let carNames = ["Tayo", "Sing", "bureong"]
        let gameSetting = GameSetting(gameCount: gameCount, carNames: carNames, randomGenerator: randomGenerator)

        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resulView = RacingGameResultViewMock()
        sut = RacingGame(inputView: inputView, resultView: resulView)

        //when
        try sut.gameReady()
        sut.gameStart()

        //then
        let result = sut.gameSetting
        XCTAssertEqual(result, gameSetting)
    }
    
    func test_inputView_validation_minus_value() throws {
        //given
        let input = -5
        let validator = RacingGameInputChecker().validator
        
        //when && then
        let expectation = InputViewError.minusCount
        XCTAssertThrowsError(try validator.checkValidation(count: input)) { error in
            XCTAssertEqual(error as? InputViewError, expectation)
        }
    }
    
    func test_inputView_conveter_incorrectFormmat_value() throws {
        
        let  input = "다섯"
        
        let converter = RacingGameInputChecker().converter
    
        //when &&then
        let expectation = InputViewError.incorrectFormat
        XCTAssertThrowsError(try converter.converterToInteger(input: input)) { error in
            XCTAssertEqual(error as? InputViewError, expectation)
        }
    }
    
    func test_inputView_correct_registerSetting_value() throws {
        //given
        let randomGenerator = RandomGenerator(range: 0..<10)
        let inputView = RacingGameInputView(randomGenerator: randomGenerator)
        let resulView = RacingGameResultViewMock()
        sut = RacingGame(inputView: inputView, resultView: resulView)

        //when
        try sut.gameReady()

        //then
        let result = sut.gameSetting
        let expectation = inputView.registerSetting()
        XCTAssertEqual(result, expectation)
    }

   
    func test_given쉼표로구분된자동차들입력_when쉼표로분리_then문자열배열로나뉘는지_체크() {
        //given
        let carNames = "Tayo,BoongBoong,Took,Bentley"
        let inputView = RacingGameInputView(randomGenerator: RandomGenerator())
        
        //then
        let expectation = inputView.splitCarNames(input: carNames)
        XCTAssertEqual(["Tayo", "BoongBoong", "Took", "Bentley"], expectation)
    }
    
    func test_when자동차의이름_5자초과_thenTextLengthExceeded_Error발생하는지_체크() throws {
        //given
        let carNames = ["Tayo","BoongBoong","Took","Bentley"]
        let validator = RacingGameInputChecker().validator
        
        //then
        let expectation = InputViewError.textLengthExceeded
        XCTAssertThrowsError(try validator.checkValidation(carNames: carNames)) { error in
            XCTAssertEqual(error as? InputViewError, expectation)
        }
    }

    func test_when레이스가끝난후_then포인트가가장높은차이름_출력_체크() throws {
        //given
        let randomGenerator = RandomGenerator(range: 0..<10)
        let cars = [
            Car(name: "Hoya", randomGenerator: randomGenerator, movePoint: 0),
            Car(name: "Lulu", randomGenerator: randomGenerator, movePoint: 1),
            Car(name: "PeachBoost", randomGenerator: randomGenerator,movePoint: 3)
        ]
        
        let gameSetting = GameSetting(gameCount: 5, carNames: ["Tayo", "Ssing"], randomGenerator: randomGenerator)
        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resultView = RacingGameResultViewMock()
        sut = RacingGame(inputView: inputView, resultView: resultView)
        let winnersName = sut.pickWinnersByPoint(candidates: cars)[0].name
        
        //then
        let exectation = "PeachBoost"
        XCTAssertEqual(winnersName, exectation)

    }

    func test_given동점인우승자가여럿이면_then동점인우승자들모두_출력_체크() {
        //given
        let randomGenerator = RandomGenerator(range: 0..<10)
        let cars = [
            Car(name: "Hoya", randomGenerator: randomGenerator, movePoint: 0),
            Car(name: "Lulu", randomGenerator: randomGenerator, movePoint: 3),
            Car(name: "PeachBoost", randomGenerator: randomGenerator,movePoint: 3)
        ]
        
        let gameSetting = GameSetting(gameCount: 5, carNames: ["Tayo", "Ssing"], randomGenerator: randomGenerator)
        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resultView = RacingGameResultViewMock()
        sut = RacingGame(inputView: inputView, resultView: resultView)
       
        let winnersCount = sut.pickWinnersByPoint(candidates: cars).count
        let exectation = 2
        
        XCTAssertEqual(winnersCount, exectation)
    }

    func test_given모두포인트가0_When우승자를뽑을때_then무효_출력_체크() throws {
        //given
        let randomGenerator = RandomGenerator(range: 0..<10)
        let gameCount = 0
        let gameSetting = GameSetting(gameCount: gameCount, carNames: ["Tayo", "Ssing"], randomGenerator: randomGenerator)
        let inputView = RacingGameInputViewMock(gameSetting: gameSetting)
        let resultView = RacingGameResultViewMock()
        sut = RacingGame(inputView: inputView, resultView: resultView)
       
        //when
        try sut.gameReady()
        sut.gameOver()
        
        //then
        let expectation = 1
        XCTAssertEqual(resultView.printNoWinnerCallCount, expectation)
    }
}
