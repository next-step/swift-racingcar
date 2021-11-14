//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 남기범 on 2021/10/27.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
    var dummyRacingCar: StubRacingCar!

    override func setUpWithError() throws {
        dummyRacingCar = StubRacingCar(name: "bmw")
    }

    override func tearDownWithError() throws {
        dummyRacingCar = nil
    }
}

// MARK: - 자동차의 동작 테스트

extension RacingCarTest {
    func test_racing_car_forward() {
        let expect = expectation(description: "자동차의 연료가 4이상 9 이하일 경우 앞으로 전진한다.")
        let range = (4...9)
        
        dummyRacingCar.called(name: "attemptForward", verify: { fuel in
            guard let fuel = fuel as? Int else { return }
            if fuel >= 4,
               fuel <= 9
            {
                expect.fulfill()
            }
        })
        
        dummyRacingCar.attemptForward(range.randomElement() ?? 0)
        
        self.wait(for: [expect], timeout: 0.1)
    }
    
    func test_racing_car_stop() {
        let expect = expectation(description: "자동차의 연료가 4이이하일 경우 앞으로 멈춘다.")
        let range = (0...3)
        
        dummyRacingCar.called(name: "attemptForward", verify: { fuel in
            guard let fuel = fuel as? Int else { return }
            if fuel < 4 {
                expect.fulfill()
            }
        })
        
        dummyRacingCar.attemptForward(range.randomElement() ?? 0)
        
        self.wait(for: [expect], timeout: 0.1)
    }
}
