//
//  RacingPrint.swift
//  RacingCar
//
//  Created by 김성준 on 2022/05/13.
//


protocol PrintRacingSituationProtocol: AnyObject{
    func participatedCars() -> [Car]
}

class PrintRacingSituation {
    weak var dataSource: PrintRacingSituationProtocol?
    
    func printSituation() {
        dataSource?.participatedCars().forEach({ car in
            print(String(repeating: "-", count: car.moveDistance))
        })
        print("\n\n")
    }
}
