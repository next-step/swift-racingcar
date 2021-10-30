//
//  UserInput.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

struct UserInput {
    
    func inputExpression() -> [String] {
        
        let input = readLine()
        
        // TODO: 예외처리
        guard let input = input else {
            return [""]
        }
        
        return input.components(separatedBy: " ")
    }
}
