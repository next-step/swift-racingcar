//
//  UserInputError.swift
//  RacingCar
//
//  Created by 강수진 on 2022/05/01.
//

import Foundation

enum UserInputError: Error, UserInformable {
    case invalidCarName
    case invalidRaceCount
    
    var guideDescription: String {
        switch self {
        case .invalidCarName:
            return "5 글자가 넘는 차 이름이 있습니다. 5 글자 내로 이름을 입력해주세요"
        case .invalidRaceCount:
            return "유효하지 않은 race 횟수입니다. 다시 앱을 시작 후, 1 이상의 숫자를 입력해주세요"
        }
    }
}
