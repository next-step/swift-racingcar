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
            print(String(repeating: "-", count: car.distance))
        }
        print("")
    }
}
