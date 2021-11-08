//
//  RacingMachineTest.swift
//  RacingTest
//
//  Created by 임현규 on 2021/11/03.
//

import XCTest
@testable import RacingCar

class RacingMachineTest: XCTestCase {
    let racingMachine = RacingMachine()
    
    func test_is_over_three() {
        XCTAssertEqual(racingMachine.isOverThree(number: 5), "-")
    }
    
    func test_start_racing() {
        var result = ""
        racingMachine.oneRoundEnded = { result = $0 }
        racingMachine.startRacing(racing: <#T##RacingInput#>)
    }
}
