//
//  Racing.swift
//  RacingCar
//
//  Created by 이우섭 on 2022/05/03.
//

import Foundation

class Racing {
    
    var participantsCount: Int?
    var drivingCount: Int?
    
    func setupInputParticipantsCount() throws {
        print(Racing.Comments.askingParticipantsCount, terminator: " ")
        
        guard let input = readLine() else { throw RacingError.emptyInput }
        guard let count = Int(input) else { throw RacingError.invalidInput }
        self.participantsCount = count
    }
    
    func setupInputDrivingCount() throws {
        print(Racing.Comments.askingDrivingCount, terminator: " ")
        
        guard let input = readLine() else { throw RacingError.emptyInput }
        guard let count = Int(input) else { throw RacingError.invalidInput }
        self.drivingCount = count
    }
}

