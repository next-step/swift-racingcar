//
//  RacingGameViewModel.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/07.
//

import Foundation
import Combine

protocol RacingGameMaterialProtocol {
    typealias CarInfo = (name: String, position: Int)
    var cars: [RacingCarProtocol] { get }
    var carInfoSubject: PassthroughSubject<[CarInfo], Never> { get }
    func startRacing()
}

extension RacingGameMaterialProtocol {
    func startRacing() {
        cars.forEach({ car in
            attemptForward(car: car, fuel: (0...9).randomElement() ?? 0)
        })
        
        carInfoSubject.send(cars.map({ ($0.name, $0.position) }))
    }
    
    private func attemptForward(car: RacingCarProtocol, fuel: Int) {
        car.attemptForward(fuel)
    }
}

protocol RacingGameOutputProtocol {
    var carPositionPublisher: AnyPublisher<[String], Never> { get }
}

class RacingGameViewModel: RacingGameMaterialProtocol, RacingGameOutputProtocol {
    var carInfoSubject = PassthroughSubject<[CarInfo], Never>()
    var cars: [RacingCarProtocol]
    var carPositionPublisher: AnyPublisher<[String], Never> {
        return carInfoSubject
            .map({ carInfos in
                carInfos.map({
                    $0.name + " : " + String.init(repeating: "_", count: $0.position)
                })
            })
            .eraseToAnyPublisher()
    }
    
    init(cars: [RacingCarProtocol]) {
        self.cars = cars
    }
}

protocol RacingCarProtocol {
    var position: Int { get }
    var name: String { get }
    var forwardCondition: ClosedRange<Int> { get }
    func attemptForward(_ fuel: Int)
}

class RacingCar: RacingCarProtocol {
    var position: Int = 0
    var name: String
    var forwardCondition: ClosedRange<Int>
    
    init(name: String, forwardCondition: ClosedRange<Int> = (4...9)) {
        self.name = name
        self.forwardCondition = forwardCondition
    }
    
    func attemptForward(_ fuel: Int) {
        guard forwardCondition.contains(fuel) else { return }
        position += 1
    }
}
