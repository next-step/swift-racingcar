//
//  RacingCar.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/12.
//

import Foundation

final class Racing {
    private var cars: [Car]
    private var moveCount: Int
    private let printer = PrintRacingSituation()
    
    init(cars: [Car], moveCount: Int) {
        self.cars = cars
        self.moveCount = moveCount
        printer.dataSource = self
    }
    
    func start() {
        for _ in 0 ..< moveCount {
            self.moveCar()
        }
    }
    
    private func generateFuel() -> Fuel {
        return Fuel()
    }
    
    private func moveCar() {
        for i in 0 ..< cars.count {
            cars[i].moveFoward(fuel: generateFuel())
        }
        printer.printSituation()
    }
}

// Mark:- PrintRacingSituationProtocol
extension Racing: PrintRacingSituationProtocol {
    func participatedCars() -> [Car] {
        return cars
    }
}

