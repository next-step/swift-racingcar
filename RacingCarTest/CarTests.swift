//
//  CarTests.swift
//  RacingCarTest
//
//  Created by Felix.mr on 2021/11/02.
//

import XCTest

class CarTests: XCTestCase {

    var car: RacingCar!
    var engine: Enginable!
    var randomNumberGenerator: RandomNumberGenerator!
    var position: Positionable!
    var engineRule: EngineRuleProtocol!
    var positionRule: PositionRuleProtocol!
    
    override func setUp() {
        super.setUp()
        
        self.positionRule = PositionRule(distance: 1)
        self.position = Position(initialPosition: 0, rule: positionRule)
    }
    
    override func tearDown() {
        super.tearDown()
        
        self.randomNumberGenerator = nil
        self.car = nil
        self.engine = nil
        self.position = nil
        self.positionRule = nil
        self.engineRule = nil
    }
    
    func test_engine_under_threshold() {
        // Given
        randomNumberGenerator = NumberGenerator(minValue: 0, maxValue: 1)
        engineRule = EngineRule(threshold: 2)
        engine = RandomEngine(randomGenerator: randomNumberGenerator, engineRule: engineRule)
        
        // When
        // Then
        XCTAssertFalse(engine.isPossibleToMove())
    }
    
    func test_position_move_distance() {
        // Given
        positionRule = PositionRule(distance: 3)
        position = Position(initialPosition: 0, rule: positionRule)
        
        // When
        position.move()
        
        // Then
        XCTAssertEqual(position as! Position, Position(initialPosition: 3, rule: positionRule))
    }
    
    func test_car_move_if_number_is_upper_four() {
        // Given
        randomNumberGenerator = NumberGenerator(minValue: 4, maxValue: 9)
        engineRule = EngineRule(threshold: 4)
        engine = RandomEngine(randomGenerator: randomNumberGenerator, engineRule: engineRule)
        car = RacingCar(engine: engine, position: position)
        
        // When
        car.move()
        
        // Then
        XCTAssertEqual(car.position as! Position, Position(initialPosition: 1, rule: positionRule))
    }
    
    func test_car_stop_if_number_is_lower_three() {
        // Given
        randomNumberGenerator = NumberGenerator(minValue: 0, maxValue: 3)
        engineRule = EngineRule(threshold: 4)
        engine = RandomEngine(randomGenerator: randomNumberGenerator, engineRule: engineRule)
        car = RacingCar(engine: engine, position: position)
        
        // When
        car.move()
        
        // Then
        XCTAssertEqual(car.position as! Position, Position(initialPosition: 0, rule: positionRule))
    }
}

