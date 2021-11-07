//
//  RacingGameViewModel.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/07.
//

import Foundation
import Combine

protocol RacingGameInputProtocol {
    var cars: [RacingCarProtocol] { get }
    func startRacing(carCount: Int)
}

protocol RacingGameOutputProtocol {
    var carPositionSubject: PassthroughSubject<[Int], Never> { get }
}

extension RacingGameInputProtocol where Self: RacingGameOutputProtocol {
    func startRacing(carCount: Int) {
        cars.forEach({ car in
            tryForward(car: car, fuel: (0...9).randomElement() ?? 0)
        })
        
        carPositionSubject.send(cars.map({ $0.position }))
    }
    
    private func tryForward(car: RacingCarProtocol, fuel: Int) {
        car.tryForward(fuel)
    }
}

class RacingGameViewModel: RacingGameInputProtocol, RacingGameOutputProtocol {
    var carPositionSubject = PassthroughSubject<[Int], Never>()
    var cars: [RacingCarProtocol]
    var carPositionPublisher: AnyPublisher<[String], Never> {
        return carPositionSubject
            .map({ carPositions in
                carPositions.map({ String.init(repeating: "_", count: $0) })
            })
            .eraseToAnyPublisher()
    }
    
    init(cars: [RacingCarProtocol]) {
        self.cars = cars
    }
}

protocol RacingCarProtocol {
    var position: Int { get }
    var forwardCondition: ClosedRange<Int> { get }
    func tryForward(_ fuel: Int)
}

class RacingCar: RacingCarProtocol {
    var position: Int = 0
    var forwardCondition: ClosedRange<Int>
    
    init(forwardCondition: ClosedRange<Int> = (4...9)) {
        self.forwardCondition = forwardCondition
    }
    
    func tryForward(_ fuel: Int) {
        guard forwardCondition.contains(fuel) else { return }
        position += 1
    }
}
