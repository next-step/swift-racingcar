//
//  RandomDigitNumberMaker.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

protocol RandomNumberMakable {
    func random() -> Int
}

struct RandomDigitNumberMaker: RandomNumberMakable {
    
    private let range = (0...9)
    
    func random() -> Int {
        return Int.random(in: range)
    }
}
