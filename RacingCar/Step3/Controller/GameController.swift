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
            self.resultView.initSetting()
            self.resultView.result(model: cars, gameSetting.attemptCount)
        } catch {
            if let error = error as? InputError {
                error.showError()
            }
        }
    }
    
    
}
