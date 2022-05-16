//
//  ResultView.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/16.
//

import Foundation

struct ResultView {
    func printCars(participatedCars: [Car]) {
        participatedCars.forEach({ car in
            print(String(repeating: "-", count: car.moveDistance))
        })
        print("\n\n")
    }
}
