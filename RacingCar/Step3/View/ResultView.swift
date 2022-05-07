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
    
    func oneRoundResult(_ cars: [Car]) {
        for car in cars {
            print("\(car.name) :",String(repeating: "-", count: car.distance))
        }
        print("")
    }
    
    func winners(_ cars: [Car]) {
        let maxValue: Int? = cars.map{$0.distance}.max()
        var winnerNames: [String?] = []
        for car in cars {
            winnerNames.append(isWinner(car, maxValue))
        }
        winnerPrint(winnerNames)
    }
    
    private func isWinner(_ car: Car,_ maxValue: Int?) -> String? {
        if car.distance == maxValue {
            return car.name
        }
        return nil
    }
    
    private func winnerPrint(_ winners: [String?]) {
        let winners = winners.compactMap{$0}.joined(separator: ",")
        print("\(winners)가 최종 우승했습니다")
    }
}
