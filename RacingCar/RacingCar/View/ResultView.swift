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
    }
    
    private func drawResultTitle() {
        print("실행 결과")
    }
    
    private func drawRound(of round: Round) {
        round.cars.forEach { car in
            let carPositionLine = String(repeating: "-", count: car.position)
            print(carPositionLine)
        }
    }
    
    private func drawLineDivider() {
        print()
    }
}
