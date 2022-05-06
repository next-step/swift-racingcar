//
//  Car.swift
//  RacingCar
//
//  Created by brian은석 on 2022/04/30.
//

import Foundation

final class Car {
    private(set) var distance: Int = 1
    let name: String
    
    init(name: String) {
        self.name = name
        print(name)
    }
    
    func move(_ value: Int) {
        self.distance += value
    }
}

