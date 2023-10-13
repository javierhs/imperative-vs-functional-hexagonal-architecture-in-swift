//
//  PasswordMother.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import Foundation
import BackOffice

final class PasswordMother {
    static func randomCorrectPassword() -> Password {
        let caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomPassword = ""
        let randomPasswordLength = Int.random(in: Password.minLength...Password.maxLength)
        for _ in 0..<randomPasswordLength {
            let indiceAleatorio = Int.random(in: 0..<caracteres.count)
            let caracterAleatorio = caracteres[caracteres.index(caracteres.startIndex, offsetBy: indiceAleatorio)]
            randomPassword.append(caracterAleatorio)
        }
        
        return Password(value: randomPassword)
    }
    
    static func randomInvalidPassword() -> Password {
        let caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomPassword = ""
        let randomPasswordLength = Int.random(in: Password.maxLength+1...Password.maxLength+2)
        
        for _ in 0..<randomPasswordLength {
            let indiceAleatorio = Int.random(in: 0..<caracteres.count)
            let caracterAleatorio = caracteres[caracteres.index(caracteres.startIndex, offsetBy: indiceAleatorio)]
            randomPassword.append(caracterAleatorio)
        }
        
        return Password(value: randomPassword)
    }
}
