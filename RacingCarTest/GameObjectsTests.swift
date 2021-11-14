//
//  GameObjectsTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/11/07.
//

import XCTest

class GameObjectsTests: XCTestCase {

    func test_assign_object() {
        // Given
        let gameObjects = GameObjects()
        let car1 = GameObjects.makeStubObject()
        let car2 = GameObjects.makeStubObject()
        let car3 = GameObjects.makeStubObject()
        
        // When
        gameObjects.assign(object: car1)
        gameObjects.assign(object: car2)
        gameObjects.assign(object: car3)
        
        // Then
        XCTAssertEqual(gameObjects.count, 3)
    }
}


// helper
class StubCar: GameObjectable {
    
    var position: Positionable
    
    init(position: Positionable) {
        self.position = position
    }
    
    func move() {
        position.move()
    }
}

struct StubPosition: Positionable {
    
    var position: Int = 0
    
    mutating func move() {
        position += 1
    }
}

private extension GameObjects {
    
    static func makeStubObject() -> GameObjectable {
        return StubCar(position: StubPosition())
    }
}
