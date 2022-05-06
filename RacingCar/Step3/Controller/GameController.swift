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
        let splitCarNames = GameGuide.splitComma(noSplitCarNames)
        for carName in splitCarNames {
            try GameGuide.validCheck(carName)
        }
        let attemptCount = try inputView.attemptSetting()
        let cars: [Car] = CarGenerator.makeCars(carNames: splitCarNames)
        resultView.initSetting(cars)
        result(model: cars, attemptCount-1)
        resultView.winners(cars)
    }
        
    private func result(model cars: [Car], _ attemptCount: Int) {
        guard attemptCount > 0 else { return }
        for _ in 1...attemptCount {
            let moveCars = GameGuide.moveCars(model: cars)
            resultView.oneRoundResult(moveCars)
        }
    }
    
}
