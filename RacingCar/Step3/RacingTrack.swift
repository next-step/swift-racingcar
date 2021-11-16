//
//  RacingTrack.swift
//  RacingCar
//
//  Created by Ppop on 2021/11/15.
//

protocol RacingTrackProtocol {
    func setupGame(completionHandler: (([(RacerPtorocol, RacingCarProtocol)], Int) -> Void)) throws
    func startGame(cars: [(RacerPtorocol, RacingCarProtocol)], trys: Int)
}

struct RacingTrack: RacingTrackProtocol {
    enum SetupGameError: Error {
        case wrongNumberOfCars
        case wrongNumberOfTrys
    }
    
    private let referee: RefereeProtocol
    
    init(referee: RefereeProtocol) {
        self.referee = referee
    }
}

extension RacingTrack {
    func setupGame(completionHandler: (([(RacerPtorocol, RacingCarProtocol)], Int) -> Void)) throws {
        // TODO: Readline 을 한줄로 사용하는 법을 찾아보자.
        guard let numberOfcars = readLine()?.compactMap({ Int($0.description) }).first else { throw SetupGameError.wrongNumberOfCars }
        print("자동차 대수는 몇 대인가요? \(numberOfcars)")
        let racingCars = makeRacingCar(numberOf: numberOfcars)
        
        guard let trys = readLine()?.compactMap({ Int($0.description) }).first else { throw SetupGameError.wrongNumberOfTrys }
        print("시도할 횟수는 몇 회인가요? \(trys)")
        
        completionHandler(racingCars, trys)
    }
    
    func startGame(cars: [(RacerPtorocol, RacingCarProtocol)], trys: Int) {
        var cars = cars
        
        print("실행 결과")
        for _ in 0..<trys {
            cars.enumerated().forEach {
                var car = $0.element
                let dice = car.0.throwDice()
                if referee.judge(dice) { car.1.move() }
                cars[$0.offset] = car
                viewRaceStatus(car.1)
            }
            print("")
        }
    }
}

// MARK: - Private Function
extension RacingTrack {
    private func makeRacingCar(numberOf: Int) -> [(RacerPtorocol, RacingCarProtocol)] {
        var cars: [(RacerPtorocol, RacingCarProtocol)] = []
        for _ in 0..<numberOf {
            let racer: RacerPtorocol = Racer()
            let racingCar: RacingCarProtocol = RacingCar()
            cars.append((racer, racingCar))
        }
        return cars
    }
    
    private func viewRaceStatus(_ car: RacingCarProtocol) {
        let currentIndex: String = String(repeating: "🚗", count: car.index+1)
        print(currentIndex)
    }
}
