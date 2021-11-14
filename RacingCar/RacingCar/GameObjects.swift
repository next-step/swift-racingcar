//
//  GameObjects.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

protocol GameObjectsProtocol {
    
    var count: Int { get }
    var positions: [Positionable] { get }
    
    func assign(object: GameObjectable)
    func run()
}

final class GameObjects: GameObjectsProtocol {
    
    private var objects: [GameObjectable]
    
    init(objects: [GameObjectable] = []) {
        self.objects = objects
    }
    
    var count: Int {
        return objects.count
    }
    
    var positions: [Positionable] {
        return objects.map { $0.position }
    }
    
    func assign(object: GameObjectable) {
        objects.append(object)
    }
    
    func run() {
        objects.forEach { $0.move() }
    }
}
