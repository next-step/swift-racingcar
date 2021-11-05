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
    
    func test_racing_car_forward() {
        let expect = expectation(description: "자동차의 연료가 4이상 9 이하일 경우 앞으로 전진한다.")
        guard let carFuel: Int = (4...9).randomElement() else { return }
        
        viewModel.called(name: "isForward", verify: { isForward in
            if (4...9).contains(carFuel) {
                expect.fulfill()
            }
        })
        
        viewModel.startRacing()
        
        self.wait(for: [expect], timeout: 0.1)
    }
}
