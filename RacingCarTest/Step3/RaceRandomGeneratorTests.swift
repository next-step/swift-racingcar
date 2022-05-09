//
//  RaceRandomGeneratorTests.swift
//  RacingCar
//
//  Created by main on 2022/05/09.
//

import XCTest

class RaceRandomGeneratorTests: XCTestCase {
    let randomGenerator = RaceRandomGenerator()
    
    func test_then랜덤결과는true또는false() {
        // given
        
        // when
        
        // then
        let result: Bool = randomGenerator.generateRunResult()
        XCTAssert(result == true || result == false)
    }
}
