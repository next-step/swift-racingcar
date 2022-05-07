//
//  ViewProtocols.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/05/03.
//

import Foundation

protocol RacingGameResult: Drawable {
    func showCarsDistance(cars: [Car])
    func printUserDistanceFromStart(car: Car)
    func printRacingResultPhrase()
    func showWinner(cars: [Car])
}


protocol RacingGameInput {
    func input() throws
    func registerSetting() -> GameSetting
   
}
