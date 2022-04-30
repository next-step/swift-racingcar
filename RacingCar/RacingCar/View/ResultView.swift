//
//  ResultView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

struct ResultView {
    
    private let roundHistory: RoundHistory
    
    init(roundHistory: RoundHistory) {
        self.roundHistory = roundHistory
    }
    
    func draw() {
        drawResultTitle()
        roundHistory.rounds
            .forEach { round in
                drawRound(of: round)
                drawLineDivider()
            }
        drawWinners()
    }
    
    private func drawResultTitle() {
        print("실행 결과")
    }
    
    private func drawRound(of round: Round) {
        round.cars.forEach { car in
            let carPositionLine = String(repeating: "-", count: car.position)
            print(car.name, carPositionLine, separator: " : ")
        }
    }
    
    private func drawLineDivider() {
        print()
    }
    
    private func drawWinners() {
        let winningCarNames: [String] = roundHistory.winningCars
            .map { car in
                return car.name
            }
        print("\(winningCarNames.joined(separator: ",")) 가 최종 우승했습니다.")
    }
}
