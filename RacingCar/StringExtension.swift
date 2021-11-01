//
//  StringExtension.swift
//  RacingCar
//
//  Created by 임현규 on 2021/10/29.
//

import Foundation

extension String {
    func toInt() -> Int? {
        if let toint = Int(self) {
            return toint
        }
        return nil
    }
    
    func isNotEmpty() -> Bool {
        return self.isEmpty ? false : true
    }
}
