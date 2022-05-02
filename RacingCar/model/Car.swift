//
//  Car.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

class Car {
    public var name: String
    public var point: Int
    
    init(_ name: String, _ point: Int = Constants.defaultPoint) {
        self.name = name
        self.point = point
    }
    
    func moveFoward() {
        self.point += 1
    }
}
