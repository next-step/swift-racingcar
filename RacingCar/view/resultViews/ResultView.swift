//
//  ResultView.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

class ResultView {
    static func printResult(_ car: Car) {
        print(String(format: "%@ : %@",
                     car.name,
                     String(repeating: "-", count: car.point)))
    }
    
    static func printWinner(_ cars: [Car]) {
        let maxPoint: Int? = cars.map { $0.point }.max()
        let winners: [String] = cars
            .filter { $0.point == maxPoint ?? 0 }
            .map { $0.name }
        
        print("\(winners.joined(separator: ", "))가 최종 우승했습니다.")
    }
}
