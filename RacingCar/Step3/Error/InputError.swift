//
//  InputError.swift
//  RacingCar
//
//  Created by brian은석 on 2022/05/01.
//

import Foundation

enum InputError: Error {
    case notNumber
    case invalidNumber
    
    var errorDescription: String {
        switch self {
        case .notNumber:
            return "입력한 값이 숫자가 아닙니다."
        case .invalidNumber:
            return "유효한 Setting 값이 아닙니다"
        }
    }
}

extension InputError {
    func showError() {
        print(self.errorDescription)
    }
}
