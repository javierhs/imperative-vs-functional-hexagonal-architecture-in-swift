//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 10/10/23.
//

import Foundation

public final class Username {
    public static let maxLength: Int = 12
    public static let minLength: Int = 3
    private let value: String
    
    public init(value: String) {
        self.value = value
    }
    
    public static func create(value: String) throws -> Username {
        if value.count < minLength || value.count > maxLength {
            throw InvalidUsernameLengthError(
                message:
                    """
                        ERROR: Username length should be between \(minLength) and \(maxLength).
                        The current length is \(value.count).
                    """
            )
        }
        
        return Username(value: value)
    }
    
    public func getValue() -> String {
        value
    }
}
