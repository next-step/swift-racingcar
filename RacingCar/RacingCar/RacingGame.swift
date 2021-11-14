//
//  RacingGame.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/09.
//

import Foundation

protocol GameProtocol {
    
    var objects: GameObjectsProtocol { get }
    var presenter: GamePresentable { get }
    var reader: GameReadable { get }
    
    func startGame()
}

class RacingGame: GameProtocol {
    
    let objects: GameObjectsProtocol
    let reader: GameReadable
    let presenter: GamePresentable
    
    init(objects: GameObjectsProtocol, reader: GameReadable, presenter: GamePresentable) {
        self.objects = objects
        self.reader = reader
        self.presenter = presenter
        
        reader.readerDelegate = self
    }
    
    func startGame() {
        read()
        present()
    }
    
    private func read() {
        reader.read()
    }
    
    private func present() {
        presenter.present(positions: objects.positions, as: "-")
    }
    
    private func makeRacingCar() -> RacingCar {
        let engine = makeEngine()
        let position = makePosition()
        let racingCar = RacingCar(engine: engine, position: position)
        
        return racingCar
    }
    
    private func makeEngine() -> Enginable {
        let randomGenerator = NumberGenerator(minValue: 0, maxValue: 9)
        let engineRule = EngineRule(threshold: 4)
        let engine = RandomEngine(randomGenerator: randomGenerator, engineRule: engineRule)
        
        return engine
    }
    
    private func makePosition() -> Positionable {
        let positionRule = PositionRule(distance: 1)
        let position = Position(initialPosition: 0, rule: positionRule)
        
        return position
    }
}

extension RacingGame: ReaderDelegate {
    
    func readObjectCount(_ gameReadable: GameReadable, count: Int) {
        for _ in 0..<count {
            let racingCar = makeRacingCar()
            objects.assign(object: racingCar)
        }
    }
    
    func readRoundCount(_ gameReadable: GameReadable, count: Int) {
        for _ in 0..<count {
            objects.run()
            present()
            print("")
        }
    }
}
