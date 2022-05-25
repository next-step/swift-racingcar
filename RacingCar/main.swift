//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

var controller = RacingController()

do {
    try controller.initRacing()
    try controller.playRacing()
} catch {
    print("Error! \(error)")
}
