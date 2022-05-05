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
//        resultView.initSetting()
//        result(model: cars, gameSetting.attemptCount)
        
        let noSplitCarNames = inputView.carNamesSetting()
        let splitCarNames = GameGuide.splitComma(noSplitCarNames)
        for carName in splitCarNames {
            try GameGuide.wordLimitDisriminate(carName)
        }
        let attemptCount = try inputView.attemptSetting()
        let cars: [Car] = Array.init(repeating: 0, count: splitCarNames.count).enumerated().map{ v in Car(name: splitCarNames[v.offset])}

        
    }
    
    private func moveCars(model cars: [Car], _ gameRound: Int) -> [Car] {
        for car in cars {
            car.move(GameGuide.rule(gameRound))
        }
        return cars
    }
    
    private func result(model cars: [Car], _ attemptCount: Int) {
        for gameRound in 1...attemptCount {
            let moveCars = moveCars(model: cars, gameRound)
            resultView.oneRoundResult(moveCars)
        }
    }
    
}
