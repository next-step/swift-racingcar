//
//  Movable.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/07.
//

import Foundation

protocol GameObjectable {
    
    var position: Positionable { get }
    
    func move()
}
