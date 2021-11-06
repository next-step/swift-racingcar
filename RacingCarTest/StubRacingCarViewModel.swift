//
//  StubRacingCarViewModel.swift
//  RacingCarTest
//
//  Created by 남기범 on 2021/11/05.
//

import Foundation
import TestHelper
import Combine

class StubRacingCarViewModel: StubContainer {
    private var carPositionSubject = PassthroughSubject<[Int], Never>()
    
    func startRacing(carCount: Int, repeatCount: Int) {
        let cars = self.resolve([Car].self, name: "setCarsForRacing")
        
        cars.forEach({ car in
            if isForward(car: car, fuel: (0...9).randomElement() ?? 0) {
                forward(car: car)
            }
        })
        
        carPositionSubject.send(cars.map({ $0.position }))
    }
    
    private func isForward(car: Car, fuel: Int) -> Bool {
        return car.isForward(fuel)
    }
    
    private func forward(car: Car) {
        car.forward()
    }
}
