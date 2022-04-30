//
//  main.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

let carCount = InputView.inputCarCount()
if !InputChecker.isValid(carCount: carCount) {
    OutputView.carCountIsInvalid()
    exit(0)
}

let roundCount = InputView.inputRoundCount()
if !InputChecker.isValid(roundCount: roundCount) {
    OutputView.roundCountIsInvalid()
    exit(0)
}

let racingCars = (0..<roundCount!).map { id in
    RacingCarFactory.create(id: id)
}
let result = RacingGame(racingCars: racingCars, roundCount: roundCount!).start()
let formattedResult = GameResultFormatter.format(result)
OutputView.show(formattedResult)
