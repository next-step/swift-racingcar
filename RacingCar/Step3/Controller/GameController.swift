//
//  GameController.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

struct GameController {
    private let inputView = InputView()
    private let resultView = ResultView()
    
    func gameStart() throws {
        let noSplitCarNames = inputView.carNamesSetting()
        let splitCarNames = GameRule.splitComma(noSplitCarNames)
        for carName in splitCarNames {
            try GameRule.validCarNameCheck(carName)
        }
        let attemptCount = try inputView.attemptSetting()
        let cars: [Car] = CarGenerator.makeCars(carNames: splitCarNames)
        resultView.initSetting()
        result(model: cars, attemptCount)
        resultView.winners(cars)
    }
        
    private func result(model cars: [Car], _ attemptCount: Int) {
        guard attemptCount > 0 else { return }
        for round in 1...attemptCount {
            let moveCars = GameRule.moveCars(model: cars, round: round)
            resultView.oneRoundResult(moveCars)
        }
    }
    
}
