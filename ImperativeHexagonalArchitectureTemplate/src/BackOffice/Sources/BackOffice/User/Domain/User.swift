//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 29/9/23.
//

import Foundation

public final class User: AggregateRoot {
    private let username: Username
    private let password: Password
    private let email: Email
    
    public init(
        username: Username,
        password: Password,
        email: Email
    ) {
        self.username = username
        self.password = password
        self.email = email
    }
    
    public static func create(
        username: String,
        password: String,
        email: String
    ) throws -> User {
        let usernameValue = try Username.create(value: username)
        let passwordValue = try Password.create(value: password)
        let emailValue = try Email.create(value: email)
        
        let user =  User(
            username: usernameValue,
            password: passwordValue,
            email: emailValue
        )
        
        user.record(listEvents:
                        UserRegisteredDomainEvent(
                            aggregatedId: email,
                            username: username,
                            password: password,
                            email: email
                        )
        )
        
        return user
    }
    
    public func usernameValue() -> String {
        username.getValue()
    }
    
    public func passwordValue() -> String {
        password.getValue()
    }
    
    public func emailValue() -> String {
        email.getValue()
    }
}
