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
    func printUserDistanceFromStart(car: Car)
    func printRacingResultPhrase()
}

final class RacingGameResultView: RacingGameResult {
     
    func printRacingResultPhrase() {
        print("실행결과")
    }
    
    func showCarsDistance(cars: [Car]) {
        
        cars.forEach{printUserDistanceFromStart(car: $0)}
        lineDivider()
    }

    func printUserDistanceFromStart(car: Car) {
        print("\(car.name) : \(String(repeating: "-", count: car.movePoint))")
    }
}
