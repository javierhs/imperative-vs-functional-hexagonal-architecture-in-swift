//
//  RegisterUserRequestMother.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import Foundation
import BackOffice

final class RegisterUserRequestMother {
    static func randomRegisterUserRequestWithCorrectData() -> RegisterUserRequest {
        let user = UserMother.randomCorrectUser()
        
        return RegisterUserRequest(
            username: user.usernameValue(),
            password: user.passwordValue(),
            email: user.emailValue()
        )
    }
    
    static func randomRegisterUserRequestWithInvalidUsernameData() -> RegisterUserRequest {
        let user = UserMother.randomUserWithInvalidUsername()
        
        return RegisterUserRequest(
            username: user.usernameValue(),
            password: user.passwordValue(),
            email: user.emailValue()
        )
    }
    
    static func randomRegisterUserRequestWithInvalidPassword() -> RegisterUserRequest {
        let user = UserMother.randomUserWithInvalidPassword()
        
        return RegisterUserRequest(
            username: user.usernameValue(),
            password: user.passwordValue(),
            email: user.emailValue()
        )
    }
    
    static func randomRegisterUserRequestWithInvalidEmail() -> RegisterUserRequest {
        let user = UserMother.randomUserWithInvalidEmail()
        
        return RegisterUserRequest(
            username: user.usernameValue(),
            password: user.passwordValue(),
            email: user.emailValue()
        )
    }
}
