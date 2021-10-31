//
//  main.swift
//  TestHelper
//
//  Created by 남기범 on 2021/10/30.
//

import Foundation

protocol Injectable {
    func register<Object>(_ type: Object.Type, name: String, provider: @escaping () -> Object)
    func resolve<Object>(_ type: Object.Type, name: String) -> Object?
}

class StubContainer: Injectable {
    private var container = [String: () -> Any?]()
    
    func register<Object>(_ type: Object.Type, name: String, provider: @escaping () -> Object) {
        container[name] = provider
    }
    
    func resolve<Object>(_ type: Object.Type, name: String) -> Object? {
        guard let provider = container[name],
              let object = provider()
        else { return nil }
        
        return object as? Object
    }
}
