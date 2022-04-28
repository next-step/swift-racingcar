//
//  RacingGame.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/28.
//

import Foundation



final class RacingGame {

    let gameSetting: GameSetting

    var cars: [Car] = []

    //MARK: - INITIALIZE
    init(gameSetting: GameSetting) {
        self.gameSetting = gameSetting
    }

    func setupCars(carCount: Int) {
        self.cars = (0..<gameSetting.carCount).map{ _ in Car()}
        
    }
    
    func gameStart() {
        setupCars(carCount: gameSetting.carCount)
        loopStage()
        
    }
  
    func loopStage() {
        
        for _ in 0..<self.gameSetting.gameCount {
            
            race()
            ResultView().showCarsDistance(cars: cars)
            print("\n")
        }
    }
    
    func race() {
        cars.filter{ _ in movePosition()}.forEach{$0.move()}
    }
    
    func movePosition() -> Bool {
        let conditionNumber = generateMoveConditionNumber()
        return isMoveToNext(randomNumber: conditionNumber)
    }
    
    func generateMoveConditionNumber() -> Int {
        return Int.random(in: 0..<10)
    }

    func isMoveToNext(randomNumber: Int) -> Bool {
        return randomNumber > 4
    }

  
}
