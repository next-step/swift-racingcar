//
//  RacingCar.swift
//  RacingCar
//
//  Created by nylah.j on 2022/04/30.
//

import Foundation

struct RacingCarFactory {
    static func create(id: Int, name: String) throws -> RacingCar {
        let range = 0..<9
        let randomNumberGenerator = RandomNumberGenerator(range: range)
        let engine = RacingCarEngine(randomNumberGenerator: randomNumberGenerator)
        return try RacingCar(id: id, name: name, engine: engine)
    }
}

struct RacingCar: Equatable  {
    enum Error: LocalizedError {
        case invalidNameCount(String)
        
        var errorDescription: String? {
            switch self {
            case .invalidNameCount(let invalidName):
                return "자동차의 이름은 \(RacingCar.minNameCount)이하여야 합니다. 잘못된 이름: \(invalidName)"
            }
        }
    }
    
    static func == (lhs: RacingCar, rhs: RacingCar) -> Bool {
        return lhs.id == rhs.id
    }
    
    static let minNameCount = 5
    
    let id: Int
    let name: String
    let engine: Engine
    private var _location = 0
    var location: Int { return _location }
    
    init(id: Int, name: String, engine: Engine) throws {
        self.id = id
        if name.count > Self.minNameCount { throw Self.Error.invalidNameCount(name)}
        self.name = name
        self.engine = engine
    }
    
    mutating func move() {
        if engine.canGo() {
            self._location += 1
        }
    }
}
