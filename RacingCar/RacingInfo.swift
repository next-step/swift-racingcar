//
//  RacingInfo.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/27.
//

import Foundation

struct RacingInfo: RacingResultPrintable {
    private let racing: [[Int]]
    
    init(racing: [[Int]]) {
        self.racing = racing
    }
    
    func result() -> [[Int]] {
        racing
    }
}
