//
//  RacingGameTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/11/03.
//

import XCTest
@testable import RacingCar

class RacingGameTest: XCTestCase {

    let racingInput = RacingInput(carCount: "2", roundCount: "3")
    lazy var racingGame = RacingGame(racing: self.racingInput)
    
    
    //?? 얘는 값을 나눠주고 프린트만 받아서 테스트를 어떻게 할지...
}
