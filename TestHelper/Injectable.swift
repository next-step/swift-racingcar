//
//  main.swift
//  TestHelper
//
//  Created by 남기범 on 2021/10/30.
//

import Foundation

protocol Injectable {
    func register<Object>(_ type: Object.Type, name: String, provider: @escaping () -> Object)
    func registerThrows<Object>(_ type: Object.Type, name: String, provider: @escaping () throws -> Object)
    func resolve<Object>(_ type: Object.Type, name: String) -> Object?
    func resolveThrows<Object>(_ type: Object.Type, name: String) throws -> Object?
}

class StubContainer: Injectable {
    private var container = [String: () -> Any?]()
    private var throwsContainer = [String: () throws -> Any?]()
    
    func register<Object>(_ type: Object.Type, name: String, provider: @escaping () -> Object) {
        container[name] = provider
    }
    
    func registerThrows<Object>(_ type: Object.Type, name: String, provider: @escaping () throws -> Object) {
        throwsContainer[name] = provider
    }
    
    func resolve<Object>(_ type: Object.Type, name: String) -> Object? {
        guard let provider = container[name],
              let object = provider()
        else { return nil }
        
        return object as? Object
    }
    
    func resolveThrows<Object>(_ type: Object.Type, name: String) throws -> Object? {
        guard let provider = throwsContainer[name] else { return nil }
        
        let object = try provider()
        return object as? Object
    }
}
