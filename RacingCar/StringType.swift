//
//  StringType.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/25.
//

import Foundation

extension String {
    
    func replacingBracketToBlank() -> String {
        return self.replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
    }
    
}
