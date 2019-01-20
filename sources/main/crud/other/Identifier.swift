//
//  Identifier.swift
//  TWUtility
//
//  Created by Rodrigo Kreutz on 27/11/2018.
//  Copyright © 2018 Teamwork. All rights reserved.
//

import Foundation

public enum Identifier {
    
    case int(Int)
    case string(Int)
    
    public var value: Int {
        
        switch self {
            
        case .int(let value):
            
            return value
        case .string(let value):
            
            return value
        }
    }
}

extension Identifier: Equatable {
    
    public static func == (lhs: Identifier, rhs: Identifier) -> Bool {
        
        return lhs.value == rhs.value
    }
}

extension Identifier: Codable {
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        if     let stringId = try? container.decode(String.self),
            let id = Int(stringId) {
            
            self = .string(id)
        } else {
            
            self = .int(try container.decode(Int.self))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        
        var container = encoder.singleValueContainer()
        switch self {
            
        case .int(let value):
            
            try container.encode(value)
        case .string(let value):
            
            try container.encode("\(value)")
        }
    }
}

extension Identifier: ExpressibleByIntegerLiteral {
    
    public init(integerLiteral value: Int) {
        
        self = .int(value)
    }
}

extension Identifier: ExpressibleByStringLiteral {
    
    public init(stringLiteral value: String) {
        
        self = .string(Int(value) ?? 0)
    }
}
