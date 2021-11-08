//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView: Inputable = InputView()
let resultView: Outputable = ResultView()
let random: Random = RandomNumber(range: RacingOption.randomNumberRange)
let racing = Racing(inputView: inputView, resultView: resultView, random: random)
racing.raceStart()
