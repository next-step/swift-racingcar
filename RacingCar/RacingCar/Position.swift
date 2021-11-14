//
//  Position.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

protocol Positionable {
    
    var position: Int { get }
    
    mutating func move()
}

extension Positionable where Self: Equatable {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.position == rhs.position
    }
}

struct Position: Positionable, Equatable {
    
    private(set) var position: Int
    private var rule: PositionRuleProtocol
    
    init(initialPosition: Int = 0, rule: PositionRuleProtocol) {
        self.position = initialPosition
        self.rule = rule
    }
    
    mutating func move() {
        position += rule.distance
    }
}
