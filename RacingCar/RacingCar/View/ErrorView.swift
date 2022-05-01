//
//  ErrorView.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/30.
//

import Foundation

struct ErrorView {
    
    private let userGuider = UserGuider()
    
    func guideInputError(of error: UserInputError) {
        userGuider.guide(for: error)
    }
}
