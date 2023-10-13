//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 10/10/23.
//

import Foundation

public protocol UserRepository {
    func register(user: User, completion: (Result<Void, Error>) -> Void)
}
