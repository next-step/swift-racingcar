//
//  CarGenerator.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/05.
//

import Foundation

struct CarGenerator {
    static func makeCars(carNames: [String]) -> [Car] {
        var cars: [Car] = []
        for name in carNames {
            cars.append(Car(name: name))
        }
        return cars
    }
}


