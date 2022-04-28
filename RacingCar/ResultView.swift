//
//  ResultView.swift
//  RacingCar
//
//  Created by jinho jeong on 2022/04/29.
//

import Foundation


final class ResultView {
    
    
    
    func showCarsDistance(cars: [Car]) {
        cars.forEach{printUserDistanceFromStart(to:$0.movePoint)}
    }
    
    func printUserDistanceFromStart(to distance: Int) {
        print("\(String(repeating: "-", count: distance))")
        

    }
}
