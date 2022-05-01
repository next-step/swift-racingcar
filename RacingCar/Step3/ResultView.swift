//
//  ResultView.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

struct ResultView {
    func initSetting(_ attemptRound: Int) {
        if attemptRound == 1 {
            print("")
            print("실행 결과")
        }
    }
    
    func result(car: Car) {
        print(String(repeating: "-", count: car.distance))
    }
    
}
