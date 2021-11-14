//
//  PositionRule.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

protocol PositionRuleProtocol {
    
    var distance: Int { get }
}

struct PositionRule: PositionRuleProtocol {
    
    private(set) var distance: Int
}
