//
//  RacingCar - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation


let gameObjects = GameObjects()
let reader = RacingGameReader()
let presenter = RacingGamePresenter()
let racingGame = RacingGame(objects: gameObjects, reader: reader, presenter: presenter)

racingGame.startGame()
