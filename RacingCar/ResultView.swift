//
//  ResultView.swift
//  RacingCar
//
//  Created by sangsun on 2021/11/16.
//

import Foundation

struct ResultView {
    
    static func showResult(cars: [Car]) {
        for i in 0..<cars.count {
            cars[i].printDistance()
        }
        print()
    }
    
}
