//
//  RacingGameReader.swift
//  RacingCar
//
//  Created by Felix.mr on 2021/11/09.
//

import Foundation

protocol ReaderDelegate: AnyObject {
    
    func readObjectCount(_ gameReadable: GameReadable, count: Int)
    func readRoundCount(_ gameReadable: GameReadable, count: Int)
}

protocol GameReadable: AnyObject {
    
    var readerDelegate: ReaderDelegate? { get set }
    
    func read()
}

class RacingGameReader: GameReadable {
    
    enum ReaderError: Error {
        
        case invalidInput
    }
    
    weak var readerDelegate: ReaderDelegate?
    
    func read() {
        try? readObjectCount()
        try? readRoundCount()
    }
    
    private func readObjectCount() throws {
        guard let count = try? readCount(with: "자동차 대수는 몇 대인가요?")
        else { throw ReaderError.invalidInput }
        
        readerDelegate?.readObjectCount(self, count: count)
    }
    
    private func readRoundCount() throws {
        guard let count = try? readCount(with: "시도할 횟수는 몇 회인가요?")
        else { throw ReaderError.invalidInput }
        
        readerDelegate?.readRoundCount(self, count: count)
    }
    
    private func readCount(with message: String) throws -> Int {
        print(message, terminator: " ")
        if let input: String = readLine(),
           let inputNumber = Int(input) {
            return inputNumber
        }
        
        throw ReaderError.invalidInput
    }
}
