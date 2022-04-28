//
//  RacingGame.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/28.
//

import Foundation

final class RacingGame {

    //MARK: - DATA PROPERRIES
    var gameSetting: GameSetting = GameSetting(gameCount: 0, carCount: 0)
    var cars: [Car] = []

    //MARK: - VIEWS
    let inputView: RacingGameInput
    let resultView: RacingGameResult
    
    //MARK: - INITIALIZE
    init(inputView: RacingGameInput, resultView: RacingGameResult) {
        self.inputView = inputView
        self.resultView = resultView
    }

    //MARK: - METHOD
    func gameStart() throws {
        try inputView.input()
        self.gameSetting = inputView.registerSetting()
        setupCars(carCount: gameSetting.carCount)
        loopStage()
        
    }
    
   private func setupCars(carCount: Int) {
        self.cars = (0..<gameSetting.carCount).map{ _ in Car()}
    }
  
    private func loopStage() {
        resultView.printRacingResultPhrase()
        (0..<self.gameSetting.gameCount).forEach { _ in
            race()
            resultView.showCarsDistance(cars: cars)
        }
    }
    
    private func race() {
        cars.filter{ _ in movePosition()}.forEach{$0.move()}
    }
    
    private func movePosition() -> Bool {
        let conditionNumber = generateMoveConditionNumber()
        return isMoveToNext(randomNumber: conditionNumber)
    }
    
    private func generateMoveConditionNumber() -> Int {
        return Int.random(in: 0..<10)
    }

    private func isMoveToNext(randomNumber: Int) -> Bool {
        return randomNumber > 4
    }

  
}
