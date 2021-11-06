//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 남기범 on 2021/10/27.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
    var viewModel: StubRacingCarViewModel!

    override func setUpWithError() throws {
        viewModel = StubRacingCarViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
}

// MARK: - 자동차의 동작 테스트

extension RacingCarTest {
    func test_racing_car_forward() {
        let expect = expectation(description: "자동차의 연료가 4이상 9 이하일 경우 앞으로 전진한다.")
        guard let carFuel: Int = (4...9).randomElement() else { return }
        
        viewModel.called(name: "isForward", verify: { _ in
            if (4...9).contains(carFuel) {
                expect.fulfill()
            }
        })
        
        viewModel.startRacing(carCount: 1, repeatCount: 1)
        
        self.wait(for: [expect], timeout: 0.1)
    }
    
    func test_racing_car_stop() {
        let expect = expectation(description: "자동차의 연료가 4이이하일 경우 앞으로 멈춘다.")
        guard let carFuel: Int = (0...3).randomElement() else { return }
        
        viewModel.called(name: "isForward", verify: { _ in
            if !(4...9).contains(carFuel) {
                expect.fulfill()
            }
        })
        
        viewModel.startRacing(carCount: 1, repeatCount: 1)
        
        self.wait(for: [expect], timeout: 0.1)
    }
}
