//
//  CarsFactory.swift
//  RacingCar
//
//  Created by 조민호 on 2021/11/05.
//

import Foundation

final class CarsFactory {
    enum CarsFactoryError: Error {
        case notExistCar
    }
    
    func makeCars(numberOfCars: Int) throws -> [Car] {
        var cars: [Car] = []
        
        guard checkValidCarState(numberOfCars: numberOfCars) else {
            throw CarsFactoryError.notExistCar
        }
        
        for _ in 0 ..< numberOfCars {
            cars.append(Car(position: GameOption.defaultPosition))
        }
        
        return cars
    }
    
    private func checkValidCarState(numberOfCars: Int) -> Bool {
        guard numberOfCars > 0 else {
            return false
        }
        
        return true
    }
}
