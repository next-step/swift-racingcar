//
//  EngineRule.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

protocol EngineRuleProtocol {
    
    var threshold: Int { get }
}

struct EngineRule: EngineRuleProtocol {
    
    private(set) var threshold: Int
}
