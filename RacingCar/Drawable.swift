//
//  Drawable.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/05/03.
//

import Foundation

protocol Drawable {
    func lineDivider()
}

extension Drawable {
    func lineDivider() {
        print("\n")
    }
}

