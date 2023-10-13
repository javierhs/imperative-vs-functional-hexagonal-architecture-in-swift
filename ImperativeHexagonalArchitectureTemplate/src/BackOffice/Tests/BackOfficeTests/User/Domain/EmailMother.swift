//
//  EmailMother.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 11/10/23.
//

import Foundation
import BackOffice

final class EmailMother {
    static func randomCorrectEmail() -> Email {
        let caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomEmail = ""
        let randomUsernameLength = Int.random(in: Username.minLength...Username.maxLength)
        for _ in 0..<randomUsernameLength {
            let indiceAleatorio = Int.random(in: 0..<caracteres.count)
            let caracterAleatorio = caracteres[caracteres.index(caracteres.startIndex, offsetBy: indiceAleatorio)]
            randomEmail.append(caracterAleatorio)
        }
        
        randomEmail += "@example.com"
        
        return Email(value: randomEmail)
    }
    
    static func randomInvalidEmail() -> Email {
        let caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomEmail = ""
        let randomUsernameLength = Int.random(in: Username.minLength...Username.maxLength)
        for _ in 0..<randomUsernameLength {
            let indiceAleatorio = Int.random(in: 0..<caracteres.count)
            let caracterAleatorio = caracteres[caracteres.index(caracteres.startIndex, offsetBy: indiceAleatorio)]
            randomEmail.append(caracterAleatorio)
        }
        
        return Email(value: randomEmail)
    }
}
