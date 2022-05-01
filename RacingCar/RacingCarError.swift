//
//  RacingCarError.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/27.
//

import Foundation

enum RacingCarError: Error {
    case input
    case invalidNumber
}
extension RacingCarError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .input:
            return "입력이 잘못되었습니다."
        case .invalidNumber:
            return "랜덤 숫자가 범위를 벗어났습니다."
        }
    }
}
