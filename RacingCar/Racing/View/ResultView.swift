//
//  ResultView.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/16.
//

import Foundation

struct ResultView {
    func printCars(participatedCars: [Car]) {
        participatedCars.forEach({ car in
            print("\(car.name) : " + String(repeating: "-", count: car.moveDistance))
        })
        print("\n\n")
    }
    
    func printWinner(participatedCars: [Car]) {
        let topScore = racingTopScore(participatedCars)
        let winners = participatedCars
            .filter { $0.moveDistance == topScore }
            .compactMap { $0.name }
            .joined(separator: ", ")
        
        print("\(winners)가 최종 우승했습니다.")
    }
    
    private func racingTopScore(_ cars: [Car]) -> Int {
        if let topScore = cars.compactMap({ $0.moveDistance }).max() {
            return topScore
        }
        return 0
    }
}
