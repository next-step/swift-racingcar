//
//  Car.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

class Car {
    public var name: String = ""
    public var point: Int = 0
    
    init(_ name: String) {
        self.name = name
    }
    
    func moveFoward() {
        self.point += 1
    }
}
