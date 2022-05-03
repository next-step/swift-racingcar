//
//  InputError.swift
//  RacingCar
//
//  Created by 카카오VX on 2022/04/29.
//

import Foundation

enum InputError: Error {
    case outOfRange
    
    var message: String {
        switch self {
        case .outOfRange: return "사용자 이름은 5자리 이하만 가능합니다. 다시 시도하세요"
        }
    }
}
