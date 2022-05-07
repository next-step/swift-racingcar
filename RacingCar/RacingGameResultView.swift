//
//  ResultView.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


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
    
    func showWinner(cars: [Car]) {
        let winnerNames = cars.map{$0.name}
        winnerNames.isEmpty ? printNoWinner() : printWinners(names: winnerNames)
    }
    
    func printWinners(names: [String]) {
        let winner = names.joined(separator:", ")
        print("\(winner)가 최종 우승했습니다.")
    }
    
    func printNoWinner(){
        print("이번 레이싱게임서 우승자가 없습니다.")
    }
    
}


