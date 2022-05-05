//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    try RacingController()
        .start(carNames: try RacingCarInput.inputCarNames(),
               racingCount: try RacingCarInput.inputTryCount())
} catch {
    dump(error.localizedDescription)
}
