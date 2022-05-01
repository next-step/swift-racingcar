//
//  ResultView.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

struct ResultView {
    func initSetting() {
        print("")
        print("실행 결과")
    }
    func result(model cars: [Car], _ attemptCount: Int) {
        for attemptRound in 1...attemptCount {
            self.carGameOneRoundResult(cars, attemptRound)
        }
    }
    private func carGameOneRoundResult(_ cars: [Car], _ attemptRound: Int) {
        for car in cars {
            car.move(GameGuide.rule(attemptRound))
            print(String(repeating: "-", count: car.distance))
        }
        print("")
    }
}
