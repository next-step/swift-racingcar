//
//  ResultView.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

class ResultView {
    static func printResult(_ car: Car) {
        print(String(format: "%@ : %@",
                     car.name,
                     String(repeating: "-", count: car.point)))
    }
}
