//
//  ResultView.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


protocol drawable {
    func lineDivider()
}

extension drawable {
    
    func lineDivider() {
        print("\n")
    }
}

protocol RacingGameResult: drawable {
    func showCarsDistance(cars: [Car])
    func printUserDistanceFromStart(to distance: Int)
    func printRacingResultPhrase()
}

final class RacingGameResultView: RacingGameResult {
     
    func printRacingResultPhrase() {
        print("실행결과")
    }
    
    func showCarsDistance(cars: [Car]) {
        cars.forEach{printUserDistanceFromStart(to:$0.movePoint)}
        lineDivider()
    }

    func printUserDistanceFromStart(to distance: Int) {
        print("\(String(repeating: "-", count: distance))")
    }
}
