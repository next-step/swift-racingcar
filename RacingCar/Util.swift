//
//  Util.swift
//  RacingCar
//
//  Created by main on 2022/05/07.
//

import Foundation

extension String {
    var isInteger: Bool {
        if let _ = Int(self) {
            return true
        } else {
            return false
        }
    }
}
