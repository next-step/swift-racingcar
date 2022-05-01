//
//  RandomGenerator.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/05/01.
//

import Foundation


protocol RandomGettable {
    func random() -> Int
    var randomRange: Range<Int> { get }
}

final class RandomGenerator: RandomGettable {
    //MARK: - PROPERTIES
    var randomRange: Range<Int>
    
    //MARK: - INITIALIZE
    init (range: Range<Int> = 0..<10) {
        self.randomRange = range
    }
    
    //MARK: - METHOD
    func random() -> Int {
        return Int.random(in: randomRange)
    }
}
