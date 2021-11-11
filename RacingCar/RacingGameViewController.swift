//
//  RacingCarViewController.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/07.
//

import Foundation
import Combine

class RacingCarInputView {
    func inputCarCount() -> Int? {
        print("자동차 대수는 몇 대인가요? ", separator: "")
        guard let carCount = Int(readLine() ?? "") else {
            return nil
        }
        
        return carCount
    }
    
    func inputTryCount() -> Int? {
        print("시도할 횟수는 몇 회인가요? ", separator: "")
        guard let tryCount = Int(readLine() ?? "") else {
            return nil
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
}

class RacingGameViewController {
    private var inputView = RacingCarInputView()
    private var outputView = RacingCarOutputView()
    
    private var viewModel: RacingGameViewModel?
    private var storedSet = Set<AnyCancellable>()
    
    func load() {
        guard let carCount = inputView.inputCarCount(),
              let tryCount = inputView.inputTryCount()
        else {
            return
        }
        
        viewModel = RacingGameViewModel(cars: setCarsForRacing(count: carCount))
        guard let viewModel = viewModel else { return }
        
        bind(viewModel)
        
        print("\n실행결과")
        for index in 0..<tryCount {
            print("===== racing \(index+1) =====")
            viewModel.startRacing()
        }
    }
    
    private func setCarsForRacing(count: Int) -> [RacingCarProtocol] {
        var cars = [RacingCar]()
        
        for _ in 0..<count {
            cars.append(RacingCar())
        }
        
        return cars
    }
    
    private func bind(_ viewModel: RacingGameViewModel) {
        viewModel.carPositionPublisher
            .sink(receiveValue: outputView.outputPrint(carPositions:))
            .store(in: &storedSet)
    }
}
