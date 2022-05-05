//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = RacingInputView()

do {
    let game = try inputView.readInput()
    print(game.participantsCount)
    print(game.drivingCount)
} catch {
    print("Error! \(error)")
}
