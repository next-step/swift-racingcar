//
//  RacingGame.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/28.
//

import Foundation


final class RacingGame {

    //MARK: - DATA PROPERRIES
   private(set) var gameSetting: GameSetting = GameSetting(randomGenerator: RandomGenerator())
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
    func gameReady() throws {
        try inputView.input()
        self.gameSetting = inputView.registerSetting()
    }
    
    func gameStart() {
        setupCars(carCount: gameSetting.carCount)
        loopStage()
    }
    
    private func setupCars(carCount: Int) {
        self.cars = (0..<gameSetting.carCount).map{ _ in Car(randomGenerator: gameSetting.randomGenerator)}
    }
  
    private func loopStage() {
        resultView.printRacingResultPhrase()
        (0..<self.gameSetting.gameCount).forEach { _ in
            race()
            resultView.showCarsDistance(cars: cars)
        }
    }
    
    private func race() {
        cars.forEach{$0.move()}
    }
}
