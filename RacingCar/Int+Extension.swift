//
//  Int+Extension.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/05/02.
//

import Foundation

extension Int {
    
    func getBiggestInt(with car: Car) -> Int {
        return car.moveCount > self ? car.moveCount : self
    }
}
