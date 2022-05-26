//
//  RacingCarTest.swift
//  RacingCarTest
//
//  Created by 김성준 on 2022/04/26.
//

import XCTest

/*
 주어진 횟수 동안 n대의 자동차는 전진 또는 멈출 수 있습니다.
 사용자는 몇 대의 자동차로 몇 번의 이동을 할 것인지를 입력할 수 있어야 합니다.
 전진하는 조건은 0에서 9 사이에서 무작위 값을 구한 후 무작위 값이 4 이상일 경우입니다.
 자동차의 상태를 화면에 출력합니다. 어느 시점에 출력할 것인지에 대한 제약은 없습니다.

 */
class RacingCarTest: XCTestCase {
    
    private var fuel: Fuel!
    private var car: Car!
    private var inputView: InputView!
    private var validator: RacingInputValidator!
    
    override func setUpWithError() throws {
        fuel = Fuel()
        car = Car(name: "TestCar")
        inputView = InputView()
        validator = RacingInputValidator()
    }
    
    override func tearDownWithError() throws {
        fuel = nil
        car = nil
        inputView = nil
        validator = nil
    }
    
    //자동차의 moveDistance는 기본값 1이다.
    func test_자동차가_연료4를_받았을때_movedistance_5인지() {
        //given
        fuel.setLiter(4)
        
        //when
        car.moveFoward(fuel: fuel)
        
        //then
        XCTAssertEqual(car.moveDistance, 5)
    }
    
    func test_자동차가_연료3를_받았을때_movedistance_1인지() {
        //given
        fuel.setLiter(3)
        
        //when
        car.moveFoward(fuel: fuel)
        
        //then
        XCTAssertEqual(car.moveDistance, 1)
    }
    
    func test_자동차이름_yagom_cozy_으로_Car_생성시_이름_입력확인() {
        //given
        let names = ["yagom", "cozy"]
        
        //when
        let cars = names.map { Car(name: $0)}
        
        //then

        XCTAssertEqual(cars[0].name, "yagom")
        XCTAssertEqual(cars[1].name, "cozy")
    }
    
    func test_자동차이름_yagom_cozy_으로_Car배열_리턴하는_메서드확인() {
        //given
        let names = ["yagom", "cozy"]
        
        //when
        let cars = Car.generateCars(with: names)
        
        //then
        XCTAssertEqual(cars[0].name, "yagom")
        XCTAssertEqual(cars[1].name, "cozy")
    }
    
    func test_입력된_자동차이름길이_5보다_큰_경우_True반환하는_검증메서드확인() {
        //given
        let validator = RacingInputValidator()
        let names = ["yagom", "cozy", "miyazaki"]
        
        //when
        let result = validator.containsWrongLength(names: names)
        
        //then
        XCTAssertEqual(result, true)
    }
    
    func test_입력된_자동차이름길이_5이하인_경우_False반환하는_검증메서드확인() {
        //given
        let validator = RacingInputValidator()
        let names = ["yagom", "cozy", "eory"]
        
        //when
        let result = validator.containsWrongLength(names: names)
        
        //then
        XCTAssertEqual(result, false)
    }
    
    func test_이동횟수_1입력받을때_validMoveCount_1반환하는지() {
        //given
        let inputMoveCount = "1"
        let validator = RacingInputValidator()
        
        //when
        let moveCount = try! validator.validMoveCount(inputMoveCount)
        
        //then
        XCTAssertEqual(moveCount, 1)
    }
    
    func test_이동횟수_일_입력받을때_error_moveCountInputCannotAssignToInt발생() {
        //given
        let inputMoveCount = "일"
        let validator = RacingInputValidator()
        
        //when/then
        XCTAssertThrowsError(try validator.validMoveCount(inputMoveCount)) { error in
            XCTAssertEqual(error as! InputError, InputError.moveCountInputCannotAssignToInt)
        }
    }
    
    func test_입력받은_자동차_하나일때_error_notEnoughCars_반환되는지() {
        //given
        let inputCarName = "벤틀리"
        let validator = RacingInputValidator()
        
        //when/then
        XCTAssertThrowsError(try validator.validCarNameLength(inputCarName)) { error in
            XCTAssertEqual(error as! InputError, InputError.notEnoughCars)
        }
    }
    
    func test_입력받은_자동차이름_벤틀리_포르쉐_문자열배열로_반환되는지() {
        //given
        let inputCarName = "벤틀리,포르쉐"
        let validator = RacingInputValidator()
        
        //when
        let cars = try! validator.validCarNameLength(inputCarName)
        
        //then
        XCTAssertEqual(cars, ["벤틀리", "포르쉐"])
    }
    
    func test_입력받은_자동차이름_벤틀리_람보르기니무르시엘라고_error_carNameTooLong_반환되는지() {
        //given
        let inputCarName = "벤틀리,람보르기니무르시엘라고"
        let validator = RacingInputValidator()
        
        //when/then
        XCTAssertThrowsError(try validator.validCarNameLength(inputCarName)) { error in
            XCTAssertEqual(error as! InputError, InputError.carNameTooLong)
        }
    }
    
    func test_입력받은_자동차이름_벤틀리_람보르기니무르시엘라고f_error_carNameTooLong_반환되는지() {
        //given
        let inputCarName = ","
        let validator = RacingInputValidator()
        
        //when/then
        XCTAssertThrowsError(try validator.validCarNameLength(inputCarName)) { error in
            XCTAssertEqual(error as! InputError, InputError.carNameIsEmpty)
        }
    }
    
    func test_레이싱_종료후_제일많이달린_자동차의_moveDistance값이_2인경우_topScore_2반환() {
        let userInput = UserInput(carNames: [""], moveCount: 1)
        let racing = try! Racing(userInput)
        let topScroe = racing.racingTopScore([Car(name: "testCar1", moveDistance: 1),
                               Car(name: "testCar2", moveDistance: 2)])
        XCTAssertEqual(topScroe, 2)
    }
    
    func test_moveDistance값이_3으로_제일높은_자동차들_공동우승하는지() {
        let userInput = UserInput(carNames: [""], moveCount: 1)
        let racing = try! Racing(userInput)
        let winner = racing.winners(participatedCars: [Car(name: "test1", moveDistance: 1),
                                                         Car(name: "test2", moveDistance: 3),
                                                       Car(name: "test3", moveDistance: 3)])
        
        XCTAssertEqual(winner.count, 2)
    }
    
    func test_moveDistance값이_제일높은_자동차의_이름이_test3_일때_winner의_정보가_test3으로_일치하는지() {
        let userInput = UserInput(carNames: [""], moveCount: 1)
        let racing = try! Racing(userInput)
        let winner = racing.winners(participatedCars: [Car(name: "test1", moveDistance: 1),
                                                         Car(name: "test2", moveDistance: 2),
                                                       Car(name: "test3", moveDistance: 3)])
        
        XCTAssertEqual(winner.first!.name, "test3")
    }
}


