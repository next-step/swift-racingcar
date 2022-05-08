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
    
    func gameSetting() throws -> GameSetting {
        let noSplitCarNames = inputView.carNamesSetting()
        let splitCarNames = GameRule.splitComma(noSplitCarNames)
        try carNameValidCheck(splitCarNames)
        
        let attemptCount = try inputView.attemptSetting()
        return GameSetting(carNames: splitCarNames, attemptCount: attemptCount)
    }
    
    func carGenerator(_ carNames: [String]) -> [Car] {
        let cars: [Car] = CarGenerator.makeCars(carNames: carNames)
        return cars
    }
    
    func gameResult(_ cars: [Car], _ attemptCount: Int) {
        resultView.initSetting()
        result(model: cars, attemptCount)
        resultView.winners(cars)
    }
    
    private func carNameValidCheck(_ splitCarNames: [String]) throws {
        try GameRule.noneDuplicateCarNameCheck(splitCarNames)

        for carName in splitCarNames {
            try GameRule.validCarNameCheck(carName)
        }
    }
        
    private func result(model cars: [Car], _ attemptCount: Int) {
        guard attemptCount > 0 else { return }
        for round in 1...attemptCount {
            let moveCars = GameRule.moveCars(model: cars, round: round)
            resultView.oneRoundResult(moveCars)
        }
    }
    
}
