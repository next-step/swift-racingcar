//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

do {
    try Racing()
        .start(carCount: try RacingCarInputOutput.inputCarCount(),
               tryCount: try RacingCarInputOutput.inputTryCount())
} catch {
    dump(error.localizedDescription)
}
