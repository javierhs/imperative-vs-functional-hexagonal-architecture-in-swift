//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 10/10/23.
//

import Foundation

public final class Password {
    public static let maxLength: Int = 10
    public static let minLength: Int = 6
    private let value: String
    
    public init(value: String) {
        self.value = value
    }
    
    public static func create(value: String) throws -> Password {
        if value.count < minLength || value.count > maxLength {
            throw InvalidPasswordLengthError(
                message:
                    """
                        ERROR: Password length should be between \(minLength) and \(maxLength).
                        The current length is \(value.count).
                    """
            )
        }
        
        return Password(value: value)
    }
    
    public func getValue() -> String {
        value
    }
}
