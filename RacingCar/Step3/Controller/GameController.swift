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
    
    func gameStart() {
        do {
            let gameSetting: (carCount: Int, attemptCount: Int) = try inputView.gameStart()
            let cars: [Car] = Array.init(repeating: 0, count: gameSetting.carCount).map{ _ in Car()}
            for attemptRound in 1...gameSetting.attemptCount {
                self.gamePrint(cars: cars, attemptRound)
            }
        } catch {
            if let error = error as? InputError {
                error.showError()
            }
        }
    }
    
    private func gameRule(_ attemptRound: Int) -> Int {
        if attemptRound == 1 {
            return 1
        }
        let randomNumber = Int.random(in: 0...9)
        guard randomNumber >= 4 else { return 0 }
        return 1
    }
    
    private func gamePrint(cars: [Car], _ attemptRound: Int) {
        self.resultView.initSetting(attemptRound)
        
        for car in cars {
            car.move(self.gameRule(attemptRound))
            self.resultView.result(car: car)
        }
        print("")
    }
}
