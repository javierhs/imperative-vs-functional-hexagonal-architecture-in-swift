//
//  InvalidEmailError.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 10/10/23.
//

import Foundation

public final class InvalidEmailError: Error {
    private let message: String
    
    public init(message: String) {
        self.message = message
    }
}
