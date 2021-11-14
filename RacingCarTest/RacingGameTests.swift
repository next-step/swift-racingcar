//
//  RacingGameTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/11/08.
//

import XCTest

class RacingGameTests: XCTestCase {

    var racingGame: RacingGame!
    var gameReader: StubRacingReader!
    var gamePresenter: StubRacingPresenter!
    
    
    override func setUp() {
        super.setUp()
        
        let gameObjects = StubGameObjects()
        gameReader = StubRacingReader()
        gamePresenter = StubRacingPresenter()
        racingGame = RacingGame(objects: gameObjects, reader: gameReader, presenter: gamePresenter)
        gameReader.readerDelegate = racingGame
    }
    
    func test_assign_object_in_racing_game() {
        racingGame.startGame()
        
        XCTAssertEqual(racingGame.objects.count, 10)
    }
    
    func test_present_and_read_in_racing_game() {
        racingGame.startGame()
        
        XCTAssertTrue(gamePresenter.isPresentSuccess)
        XCTAssertTrue(gameReader.isReadSuccess)
    }
}

class StubGameObjects: GameObjectsProtocol {
    
    private var objects: [GameObjectable] = []
    var count: Int {
        return objects.count
    }
    var positions: [Positionable] {
        return objects.map { $0.position }
    }
    
    func assign(object: GameObjectable) {
        self.objects.append(object)
    }
    
    func run() {
        objects.forEach { $0.move() }
    }
}

class StubRacingPresenter: GamePresentable {
    
    var isPresentSuccess: Bool = false
    
    func present(positions: [Positionable], as presentedString: String) {
        isPresentSuccess = true
    }
}

class StubRacingReader: GameReadable {
    
    var isReadSuccess: Bool = false
    var readerDelegate: ReaderDelegate?
    
    func read() {
        isReadSuccess = true
        readObjectCount()
    }
    
    func readObjectCount() {
        readerDelegate?.readObjectCount(self, count: 10)
    }
}


