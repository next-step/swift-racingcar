//
//  ResultView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

struct ResultView {
    
    private let raceRecords: [[Int]]
    
    init(raceRecords: [[Int]]) {
        self.raceRecords = raceRecords
    }
    
    func drawFinalRaceRecords() {
        drawResultTitle()
        raceRecords.forEach { raceRecord in
            drawRaceRecord(of: raceRecord)
            drawLineDivider()
        }
    }
    
    private func drawResultTitle() {
        print("실행 결과")
    }

    private func drawRaceRecord(of carPositions: [Int]) {
        carPositions.forEach { carPosition in
            let carPositionLine = String(repeating: "-", count: carPosition)
            print(carPositionLine)
        }
    }

    private func drawLineDivider() {
        print()
    }
}
