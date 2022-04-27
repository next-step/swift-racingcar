//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let gameInfo = GameInfo(carNumber: InputView.readCarNumber(),
                        matchNumber: InputView.readMatchNumber())

RacingGame.play(gameInfo)
