//
//  RacingCarOutput.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/05/01.
//

import Foundation

struct RacingCarOutput {
    
    private static func printMove(_ car: Car) {
        print("\(car.name) : ", terminator: "")
        for _ in 0 ..< car.moveCount {
            print("-", terminator: "")
        }
        print("")
    }
    
    static func printCars(_ cars: [Car]) {
        cars.forEach { car in
            printMove(car)
        }
        print("")
    }
    
    static func printWinners(_ winners: [String]) {
        print("\(winners.joined(separator: ", "))가 최종 우승했습니다.")
    }
}
