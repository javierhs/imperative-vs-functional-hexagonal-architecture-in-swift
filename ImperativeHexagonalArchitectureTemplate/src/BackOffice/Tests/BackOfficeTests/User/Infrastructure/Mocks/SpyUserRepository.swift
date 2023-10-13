//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 12/10/23.
//

import Foundation
import BackOffice

class SpyUserRepository: UserRepository {
    var numberOfTimesRegisterMethodCalled = 0
    
    func register(user: User, completion: (Result<Void, Error>) -> Void) {
        numberOfTimesRegisterMethodCalled += 1
    }
}

final class SuccessSpyUserRepository: SpyUserRepository {
    override func register(user: User, completion: (Result<Void, Error>) -> Void) {
        super.register(user: user, completion: completion)
        completion(.success({}()))
    }
}

final class FailureSpyUserRepository: SpyUserRepository {
    private let error: Error
    
    init(error: Error) {
        self.error = error
    }
    
    override func register(user: User, completion: (Result<Void, Error>) -> Void) {
        super.register(user: user, completion: completion)
        completion(.failure(error))
    }
}
