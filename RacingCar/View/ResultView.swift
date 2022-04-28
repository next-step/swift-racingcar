//
//  ResultView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

struct ResultView {
    
    private let raceRecords: [[Car]]
    
    init(raceRecords: [[Car]]) {
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
    
    private func drawRaceRecord(of cars: [Car]) {
        cars.forEach { car in
            let carPositionLine = String(repeating: "-", count: car.position)
            print(carPositionLine)
        }
    }

    private func drawLineDivider() {
        print()
    }
}
