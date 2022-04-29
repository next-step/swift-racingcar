//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let randomGenerator = RandomGenerator()
let inputView = RacingGameInputView(randoGenerator: randomGenerator)
let resultView = RacingGameResultView()


let racingGame = RacingGame(inputView: inputView, resultView: resultView)
try racingGame.gameStart()
