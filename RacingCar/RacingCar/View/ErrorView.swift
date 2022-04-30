//
//  ErrorView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/30.
//

import Foundation

private enum Error: UserInformable {
    case notInt
    
    var guideDescription: String {
        switch self {
        case .notInt:
            return "숫자 형식이 아닙니다. 다시 앱을 시작 후, 숫자를 입력해주세요"
        }
    }
}

struct ErrorView {
    
    private let userGuider = UserGuider()
    
    func guideNotIntInputError() {
        userGuider.guide(for: Error.notInt)
    }
}
