//
//  LoginUserRequest.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import Foundation

public struct RegisterUserRequest {
    public let username: String
    public let password: String
    public let email: String
    
    public init(
        username: String,
        password: String,
        email: String
    ) {
        self.username = username
        self.password = password
        self.email = email
    }
}
