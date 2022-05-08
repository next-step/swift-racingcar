//
//  GameRule.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/07.
//

import Foundation

struct GameRule {
    static func randomNumber() -> Int {
        return Int.random(in: 0...9)
    }
    
    static func moveDistance(_ randomNumber: Int) -> Int {
        guard randomNumber >= 4 else { return 0 }
        return 1
    }
    
    static func splitComma(_ input: String) -> [String] {
        return input.components(separatedBy: ",").map{String($0)}
    }
    
    @discardableResult
    static func validCarNameCheck(_ carName: String) throws -> Bool {
        if carName.isEmpty {
            throw InputError.emptyName
        }
        if carName.count > 5 {
            throw InputError.overCountNameLength
        }
        return true
    }
    
    @discardableResult
    static func validNumberCheck(_ input: Int) throws -> Bool {
        if input < 1 {
            throw InputError.invalidNumber
        }
        return true
    }
    
    @discardableResult
    static func noneDuplicateCarNameCheck(_ input: [String]) throws -> Bool {
        if Set(input).count != input.count {
            throw InputError.duplicateName
        }
        return true
    }
    
    static func moveCars(model cars: [Car], round: Int) -> [Car] {
        guard round > 1 else { return cars }
        for car in cars {
            car.move(GameRule.moveDistance(GameRule.randomNumber()))
        }
        return cars
    }
    

}
