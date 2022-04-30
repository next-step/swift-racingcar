//
//  RacingCarGame.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/28.
//

import Foundation

struct RacingCarGame {
    
    private enum Constants {
        static let minimumDigitToCarGoForward: Int = 4
    }
    
    let roundHistory = RoundHistory()
    private let initialRound: Round
    private let raceCount: Int
    private let randomDigitNumberMaker: RandomNumberMakable
    
    init(carCount: Int,
         raceCount: Int,
         randomDigitNumberMaker: RandomNumberMakable) {
        let initialCars = Array(repeating: Car(position: 0),
                                count: carCount)
        self.initialRound = Round(cars: initialCars)
        self.raceCount = raceCount
        self.randomDigitNumberMaker = randomDigitNumberMaker
    }
    
    
    func start() {
        guard raceCount > 0 else {
            return
        }
        (1...raceCount).forEach { _ in
            let lastRound: Round = roundHistory.rounds.last ?? initialRound
            let newRound: Round = newRound(from: lastRound)
            roundHistory.append(newRound)
        }
    }
    
    private func newRound(from round: Round) -> Round {
        let newRoundCars: [Car] = round
            .cars
            .map { car -> (Car, Bool) in
                let randomNumber: Int = randomDigitNumberMaker.random()
                let canGoForward: Bool = randomNumber >= Constants.minimumDigitToCarGoForward
                return (car, canGoForward)
            }
            .map { car, canGoForward -> Int in
                let originalPosition: Int = car.position
                let newPosition: Int = canGoForward ? originalPosition + 1 : originalPosition
                return newPosition
            }
            .map(Car.init)
        let newRound = Round(cars: newRoundCars)
        return newRound
    }
}
