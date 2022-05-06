//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by brian은석 on 2022/05/01.
//

import XCTest
@testable import RacingCar

class RacingCarTest: XCTestCase {
    let inputView = InputView()
    var carNames: [String] = []
    var cars: [Car] = []
    
    override func setUpWithError() throws {
        carNames = ["abc","ccc","ddd"]
    }
    override func tearDownWithError() throws {

    }
    func test_자동차_이름을_주어진이름으로_입력되면_성공() {
        let carName = "주어진이름"
        let car = Car(name: carName)
        let result = car.name == carName
        XCTAssert(result == true,"주어진 이름으로 입력이 안되고 있습니다")
    }
    
    func test_주어진이름들로_자동차가_만들어지면_성공() {
        let cars = CarGenerator.makeCars(carNames: carNames)
        let makingCarsNames = cars.map{$0.name}
        XCTAssert(carNames == makingCarsNames,"자동차 만드는데 오류가 있습니다.")
    }

    
}


