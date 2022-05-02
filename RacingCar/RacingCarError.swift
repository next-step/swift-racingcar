//
//  RacingCarError.swift
//  RacingCar
//
//  Created by YooBin Jo on 2022/04/27.
//

import Foundation

enum RacingCarError: Error {
    case input
    case emptyNames
    case invalidNumber
    case invalidString
}
extension RacingCarError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .input:
            return "입력이 잘못되었습니다."
        case .emptyNames:
            return "입력된 이름이 없습니다."
        case .invalidNumber:
            return "숫자가 범위를 벗어났습니다."
        case .invalidString:
            return "차량 이름들이 잘못되었습니다."
        }
    }
}
