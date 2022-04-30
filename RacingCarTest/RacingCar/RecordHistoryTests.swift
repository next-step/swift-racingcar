//
//  RecordHistoryTests.swift
//  RacingCarTest
//
//  Created by 강수진 on 2022/04/30.
//

import XCTest

class RoundHistoryTests: XCTestCase {
    
    var sut: RoundHistory!
    
    override func setUpWithError() throws {
        sut = RoundHistory()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_roundCount_whenAppendOneRound_equalToOne() throws {
        // given
        let car: Car = Car(name: "naljin", position: 0)
        let round: Round = Round(cars: [car])
        
        // when
        sut.append(round)
        
        // then
        let result = sut.rounds.count
        let expectation = 1
        XCTAssertEqual(result, expectation)
    }
    
    func test_appendedCarInfo() throws {
        // given
        let car: Car = Car(name: "naljin",
                           position: 0)
        let round: Round = Round(cars: [car])
        
        // when
        sut.append(round)
        
        // then
        let firstRound = sut.rounds.first
        let firstCar = firstRound?.cars.first
        XCTAssertEqual(firstCar?.name, "naljin")
        XCTAssertEqual(firstCar?.position, 0)
    }
    
    func test_winningCarNames_whenHasNoAppendedRound_toBempty() throws {
        // then
        XCTAssertTrue(sut.winningCars.isEmpty)
    }
    
    func test_winningCarNames_whenHasNoSameMaxPosition() throws {
        // given
        let firstCar = Car(name: "car1", position: 1)
        let secondCar = Car(name: "car2", position: 2)
        let thirdCar = Car(name: "car3", position: 3)
        
        let finalRound: Round = Round(cars: [firstCar, secondCar, thirdCar])
        
        // when
        sut.append(finalRound)
        
        // then
        let winningCarNames = sut.winningCars.map { $0.name }
        let expectation = ["car3"]
        XCTAssertEqual(winningCarNames, expectation)
    }
    
    func test_winningCarNames_whenHasSameMaxPosition_returnsBoth() throws {
        // given
        let firstCar = Car(name: "car1", position: 1)
        let secondCar = Car(name: "car2", position: 2)
        let thirdCar = Car(name: "car3", position: 2)
        
        let finalRound: Round = Round(cars: [firstCar, secondCar, thirdCar])
        
        // when
        sut.append(finalRound)
        
        // then
        let winningCarNames = sut.winningCars.map { $0.name }
        let expectation = ["car2", "car3"]
        XCTAssertEqual(winningCarNames, expectation)
    }
}
