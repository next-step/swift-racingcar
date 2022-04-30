//
//  InputError.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

enum InputEror: Error, CustomDebugStringConvertible {
    case invalidCarInfo
    case invalidCount
    
    var debugDescription: String {
        switch self {
        case .invalidCarInfo: return "자동차 정보 입력 오류"
        case .invalidCount: return "게임 횟수 입력 오류"
        }
    }
}
