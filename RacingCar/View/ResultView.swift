//
//  ResultView.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/16.
//

import Foundation

struct ResultView {
    func printProgress(_ participatedCars: [Car]) {
        participatedCars.forEach({ car in
            print("\(car.name) : " + String(repeating: "-", count: car.moveDistance))
        })
        print("\n\n")
    }
    
    func printGameResult(winnerCars: [Car]) {
        let topScoreCar = winnerCars
            .compactMap { $0.name }
            .joined(separator: ", ")
        
        print("\(topScoreCar)가 최종 우승했습니다.")
    }
}
