//
//  InputView.swift
//  RacingCar
//
//  Created by ycsong on 2022/04/28.
//

class InputView {
    static func readCarInfo() throws -> [Car] {
        if let input: String = readLine() {
            let cars: [Car] = input.components(separatedBy: ",")
                .filter { (car) in
                    let name = car.trimmingCharacters(in: .whitespaces)
                    return isValidName(name)
                }
                .map { (name) in
                    return Car(name)
                }
            
            if cars.isEmpty {
                throw InputEror.invalidCarInfo
            }
            
            return cars
        }
        throw InputEror.invalidCarInfo
    }
    
    static func readCount() throws -> Int {
        if let input: String = readLine(),
           let inputNumber: Int = Int(input) {
            return inputNumber
        }
        throw InputEror.invalidCount
    }
}

extension InputView {
    private static func isValidName(_ name: String, _ min: Int = 0, _ max:Int = 5) -> Bool {
        return name.count > min && name.count < max
    }
}
