//
//  InputError.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

enum InputEror: Error, CustomDebugStringConvertible {
    case invalidInput
    
    var debugDescription: String {
        switch self {
        case .invalidInput:
            return "사용자 입력 오류"
        }
    }
}
