//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let game = GameController()
do {
    try game.gameStart()
} catch {
    if let error = error as? InputError {
        error.showError()
    }
}

