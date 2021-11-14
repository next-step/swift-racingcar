//
//  RacingCarViewController.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/07.
//

import Foundation
import Combine

class RacingCarInputView {
    enum InputError: Error {
        case invalidCarName
        case invalidAttemptCount
    }
    
    func inputCarNames(separator: String) throws -> [String] {
        print("경주할 자동차 이름을 입력하세요(이름은 쉼표(\(separator))를 기준으로 구분).")
        guard let carNames = readLine()?.components(separatedBy: separator)
        else {
            throw InputError.invalidCarName
        }
        
        return carNames
    }
    
    func inputAttemptCount() throws -> Int {
        print("시도할 횟수는 몇 회인가요? ")
        guard let tryCount = Int(readLine() ?? "") else {
            throw InputError.invalidAttemptCount
        }
        
        return tryCount
    }
}

class RacingCarOutputView {
    func outputPrint(carPositions: [String]) {
        carPositions.forEach({ carPosition in
            print(carPosition)
        })
        
        print()
    }
    
    func winnersPrint(_ winners: [String]) {
        let winnersString = winners.joined(separator: ",")
        print(winnersString + "가 최종 우승했습니다.")
    }
}

class RacingGameViewController {
    private var inputView = RacingCarInputView()
    private var outputView = RacingCarOutputView()
    
    private var viewModel: RacingGameViewModel?
    private var storedSet = Set<AnyCancellable>()
    
    func load() {
        do {
            let carNames = try inputView.inputCarNames(separator: ",")
            let attemptCount = try inputView.inputAttemptCount()
            
            let racingCars = factoryCars(with: carNames)
            bindViewModel(cars: racingCars)
            printRacingResult(attemptCount: attemptCount)
        } catch {
            print(error)
        }
    }
    
    private func bindViewModel(cars: [RacingCarProtocol]) {
        viewModel = RacingGameViewModel(cars: cars)
        guard let viewModel = viewModel else { return }
        
        viewModel.carPositionPublisher
            .sink(receiveValue: outputView.outputPrint(carPositions:))
            .store(in: &storedSet)
    }
    
    private func printRacingResult(attemptCount: Int) {
        guard let viewModel = viewModel else { return }
        
        print("\n실행결과")
        for index in 0..<attemptCount {
            print("===== racing \(index+1) =====")
            viewModel.startRacing()
        }
        
        outputView.winnersPrint(viewModel.winners)
    }
    
    private func factoryCars(with names: [String]) -> [RacingCarProtocol] {
        return names.map { name in
            RacingCar(name: name)
        }
    }
}
