//
//  UserMother.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import Foundation
import BackOffice

final class UserMother {
    static func randomCorrectUser() -> User {
        User(
            username: UsernameMother.randomCorrectUsername(),
            password: PasswordMother.randomCorrectPassword(),
            email: EmailMother.randomCorrectEmail()
        )
    }
    
    static func randomInvalidUser() -> User {
        User(
            username: UsernameMother.randomInvalidUsername(),
            password: PasswordMother.randomInvalidPassword(),
            email: EmailMother.randomInvalidEmail()
        )
    }
    
    static func randomUserWithInvalidUsername() -> User {
        User(
            username: UsernameMother.randomInvalidUsername(),
            password: PasswordMother.randomCorrectPassword(),
            email: EmailMother.randomCorrectEmail()
        )
    }
    
    static func randomUserWithInvalidPassword() -> User {
        User(
            username: UsernameMother.randomCorrectUsername(),
            password: PasswordMother.randomInvalidPassword(),
            email: EmailMother.randomCorrectEmail()
        )
    }
    
    static func randomUserWithInvalidEmail() -> User {
        User(
            username: UsernameMother.randomCorrectUsername(),
            password: PasswordMother.randomCorrectPassword(),
            email: EmailMother.randomInvalidEmail()
        )
    }
}
