//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 10/10/23.
//

import Foundation

public final class UserRegisteredDomainEvent: DomainEvent {
    private let topic = "UserRegisteredDomainEvent"
    private let usernameKey = "username"
    private let passwordKey = "password"
    private let emailKey = "email"
    private let username: String
    private let password: String
    private let email: String
    
    public init(
        aggregatedId: String,
        username: String,
        password: String,
        email: String
    ) {
        self.username = username
        self.password = password
        self.email = email
        super.init(aggregatedId: aggregatedId)
    }
    
    public init(
        aggregatedId: String,
        eventId: String,
        occurredOn: String,
        username: String,
        password: String,
        email: String
    ) {
        self.username = username
        self.password = password
        self.email = email
        super.init(
            aggregatedId: aggregatedId,
            eventId: eventId,
            occurredOn: occurredOn
        )
    }
    
    public override func getTopic() -> String {
        topic
    }
    
    public override func toPrimitives() -> [String : Codable] {
        let userRegisteredDomainEventDictionary: [String : Codable] = [
            usernameKey: username,
            passwordKey: password,
            emailKey: email
        ]
        
        return super.toPrimitives().merging(userRegisteredDomainEventDictionary) { $1 }
    }
    
    public override func fromPrimitives(
        aggregatedId: String,
        body: [String : Codable],
        eventId: String,
        occurredOn: String
    ) -> DomainEvent {
        UserRegisteredDomainEvent(
            aggregatedId: aggregatedId,
            eventId: eventId,
            occurredOn: occurredOn,
            username: body[usernameKey] as? String ?? "",
            password: body[passwordKey] as? String ?? "",
            email: body[emailKey] as? String ?? ""
        )
    }
    
    
}
