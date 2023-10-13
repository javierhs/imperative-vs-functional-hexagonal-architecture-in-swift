//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 10/10/23.
//

import Foundation

public final class Email {
    private let value: String
    
    public init(value: String) {
        self.value = value
    }
    
    public static func create(value: String) throws -> Email {
        if !isValid(email: value) {
            throw InvalidEmailError(
                message:
                        """
                            ERROR: The current value \"\(value)\" is not an email.
                        """
            )
        }

        return Email(value: value)
    }
    
    private static func isValid(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    public func getValue() -> String {
        value
    }
}
