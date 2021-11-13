//
//  RacingCarViewController.swift
//  RacingCar
//
//  Created by 남기범 on 2021/11/07.
//

import Foundation
import Combine

class RacingCarInputView {
    func inputCarNames() -> [RacingCarProtocol]? {
        print("경주할 자동차 이름을 입력하세요(이름은 쉼표(,)를 기준으로 구분).", terminator: "")
        guard let carNames = readLine()?.components(separatedBy: ",")
        else {
            return nil
        }
        
        let racingCars = carNames.map({ RacingCar(name: $0) })
        return racingCars
    }
    
    func inputTryCount() -> Int? {
        print("시도할 횟수는 몇 회인가요? ", terminator: "")
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
        guard let racingCars = inputView.inputCarNames(),
              let tryCount = inputView.inputTryCount()
        else {
            return
        }
        
        viewModel = RacingGameViewModel(cars: racingCars)
        guard let viewModel = viewModel else { return }
        
        bind(viewModel)
        
        print("\n실행결과")
        for index in 0..<tryCount {
            print("===== racing \(index+1) =====")
            viewModel.startRacing()
        }
    }
    
    private func bind(_ viewModel: RacingGameViewModel) {
        viewModel.carPositionPublisher
            .sink(receiveValue: outputView.outputPrint(carPositions:))
            .store(in: &storedSet)
    }
}
