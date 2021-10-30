//
//  UserInput.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

struct UserInput {
    
    func inputExpression() -> [String]? {
        
        let input = readLine()
        
        return input?.components(separatedBy: " ")
    }
}
