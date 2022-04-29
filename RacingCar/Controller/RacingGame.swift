//
//  RacingGame.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/28.
//

import Foundation


protocol RandomGettable {
    func random() -> Int
    var randomRange: Range<Int> { get }
  
}

final class RandomGenerator: RandomGettable {
    //MARK: - PROPERTIES
    var randomRange: Range<Int>
    
    //MARK: - INITIALIZE
    init (range: Range<Int> = 0..<10) {
        self.randomRange  = range
    }
    
    //MARK: - METHOD
    func random() -> Int {
        return Int.random(in: randomRange)
    }
    
}


final class RacingGame {

    //MARK: - DATA PROPERRIES
    var gameSetting: GameSetting = GameSetting(randomGenerator: RandomGenerator())
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
