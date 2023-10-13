//
//  LoginUserUseCase.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import Foundation

public final class RegisterUserUseCase {
    private let repository: UserRepository
    private let eventBus: EventBus
    
    public init(
        repository: UserRepository,
        eventBus: EventBus
    ) {
        self.repository = repository
        self.eventBus = eventBus
    }
    
    public func invoke(
        request: RegisterUserRequest,
        completion: (Result<Void, Error>) -> Void
    ) throws {
        let user = try User.create(
            username: request.username,
            password: request.password,
            email: request.email
        )
        
        repository.register(user: user) { result in
            if case .success(_) = result {
                for event in user.pullRecordedEvents() {
                    eventBus.publish(event)
                }
            }
            
            completion(result)
        }
    }
}
