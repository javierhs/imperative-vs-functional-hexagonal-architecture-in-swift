//
//  UsernameMother.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import Foundation
import BackOffice

final class UsernameMother {
    static func randomCorrectUsername() -> Username {
        let caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomUsername = ""
        let randomUsernameLength = Int.random(in: Username.minLength...Username.maxLength)
        
        for _ in 0..<randomUsernameLength {
            let indiceAleatorio = Int.random(in: 0..<caracteres.count)
            let caracterAleatorio = caracteres[caracteres.index(caracteres.startIndex, offsetBy: indiceAleatorio)]
            randomUsername.append(caracterAleatorio)
        }
        
        return Username(value: randomUsername)
    }
    
    static func randomInvalidUsername() -> Username {
        let caracteres = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomUsername = ""
        let randomUsernameLength = Int.random(in: Username.maxLength+1...Username.maxLength+2)
        
        for _ in 0..<randomUsernameLength {
            let indiceAleatorio = Int.random(in: 0..<caracteres.count)
            let caracterAleatorio = caracteres[caracteres.index(caracteres.startIndex, offsetBy: indiceAleatorio)]
            randomUsername.append(caracterAleatorio)
        }
        
        return Username(value: randomUsername)
    }
}
