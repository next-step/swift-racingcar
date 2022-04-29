//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let gameInfo = GameInfo(carNumber: InputView.readCarNumber(),
                        round: InputView.readRound())
let forwardNumberMaker = RacingForwardRandomNumberMaker()

RacingGame.play(gameInfo: gameInfo, forwardNumberMakable: forwardNumberMaker)
