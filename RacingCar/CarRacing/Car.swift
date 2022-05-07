//
//  Car.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/07.
//

import Foundation

class Car {
    struct Const {
        static let moveSuccessableRange: ClosedRange<Int> = 4...9
    }
    
    private(set) var position: Int
    
    init(position: Int) {
        self.position = position
    }
    
    func drive(by distance: Int) {
        guard Const.moveSuccessableRange ~= distance else { return }
        self.moveForword()
    }
    
    func moveForword() {
        self.position += 1
    }
}
