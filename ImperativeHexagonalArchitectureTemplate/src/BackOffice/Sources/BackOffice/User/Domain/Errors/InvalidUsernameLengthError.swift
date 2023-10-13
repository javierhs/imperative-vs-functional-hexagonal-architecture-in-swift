//
//  InvalidUsernameLengthError.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 10/10/23.
//

import Foundation

public final class InvalidUsernameLengthError: Error {
    private let message: String
    
    public init(message: String) {
        self.message = message
    }
}
