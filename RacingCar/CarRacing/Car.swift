//
//  Car.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/07.
//

import Foundation

class Car {
    private struct Const {
        static let moveSuccessableRange: ClosedRange<Int> = 4...9
    }
    
    private(set) var name: String
    private(set) var position: Int
    
    init(name: String, position: Int) {
        self.name = name
        self.position = position
    }
    
    func drive(by distance: Int) {
        guard Const.moveSuccessableRange ~= distance else { return }
        self.moveForword()
    }
    
    private func moveForword() {
        self.position += 1
    }
}
