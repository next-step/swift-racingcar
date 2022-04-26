//
//  step1.swift
//  RacingCar
//
//  Created by Dustin on 2022/04/26.
//

import Foundation

struct Step1 {
    
    func splitByComma(_ input: String) -> [String] {
         return input.split(separator: ",").map {
            String($0)
        }
    }
    
    func replacingBracket(_ input: String) -> String {
        return input.replacingOccurrences(of: "(", with: "").replacingOccurrences(of: ")", with: "")
        
    }
    
}
