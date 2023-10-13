//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 12/10/23.
//

import Foundation

public final class UserAlreadyRegisteredError: Error {
    private let message: String
    
    public init(message: String) {
        self.message = message
    }
}
