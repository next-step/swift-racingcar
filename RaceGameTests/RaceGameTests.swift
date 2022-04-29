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
        //sut = nil
    }
    
    func test_input_randomRange_0_between_9 () {
        //given
        let randomGenerator = RandomGenerator()
        let inputView = RacingGameInputView(randoGenerator: randomGenerator)
        let resultView = RacingGameResultView()
       
        
        sut = RacingGame(inputView: inputView, resultView: resultView)
        //when
        for _ in 0..<50 {
            let randomInteger = randomGenerator.generateMoveConditionNumber()
            print("randomInteger: \(randomInteger)")
            //then
            let expectation = 0..<10
            XCTAssertTrue(expectation.contains(randomInteger))
        }
    }
    
}
