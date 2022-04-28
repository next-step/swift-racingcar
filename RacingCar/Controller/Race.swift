//
//  RacingGame.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/28.
//

import Foundation



final class RacingGame {

    let gameSetting: GameSetting

    var gameUserArray: [Car] = []

    //MARK: - INITIALIZE
    init(gameSetting: GameSetting) {
        self.gameSetting = gameSetting
    }

    func race() {
       
    }

    func moveToNext(randomNumber: Int) -> Int {
        return randomNumber > 4 ? 1 : 0
    }

    func printUserDistanceFromStart(to distance: Int) {
      print(Array.init(repeating: "-", count: distance).joined())

    }
}
