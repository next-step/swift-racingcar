//
//  RacingGameViewModelTest.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/11.
//

import XCTest
@testable import RacingCar

class RacingGameViewModelTest: XCTestCase {
    var viewModel: RacingGameViewModel!

    override func setUpWithError() throws {
        let car = RacingCar()
        viewModel = RacingGameViewModel(cars: [car])
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
}
