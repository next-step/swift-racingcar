//
//  Car.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class Car {
    
    var movePoint: Int = 0
    
    
    init() {
       
    }
    
    func move() {
        movePoint += 1
    }
}
