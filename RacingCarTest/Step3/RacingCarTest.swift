//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by Ppop on 2021/11/15.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
    var racingCar: RacingCarProtocol!
    
    override func setUpWithError() throws {
        racingCar = RacingCar()
    }
    
    override func tearDownWithError() throws {
        racingCar = nil
    }
    
    func test_RacingCar_InitIndex() {
        XCTAssertEqual(0, racingCar.index)
    }
    
    func test_RacingCarMove() {
        racingCar.move()
        XCTAssertEqual(racingCar.index, 1)
    }
}
