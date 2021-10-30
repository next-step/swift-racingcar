//
//  UserInput.swift
//  RacingCar
//
//  Created by 조민호 on 2021/10/30.
//

import Foundation

struct UserInput {
    
    func inputExpression() -> String {
        
        let input = readLine()
        
        // TODO: 에러처리
        guard let input = input else {
            return ""
        }
        
        return input
    }
}
