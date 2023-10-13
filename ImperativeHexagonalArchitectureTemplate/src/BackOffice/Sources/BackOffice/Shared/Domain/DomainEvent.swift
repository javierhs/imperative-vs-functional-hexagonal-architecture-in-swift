//
//  Event.swift
//  ProyectoPorDefecto
//
//  Created by Javier Hernandez Sansalvador on 9/6/23.
//

import Foundation

open class DomainEvent {
    private let aggregateId: String
    private let eventId: String
    private let occurredOn: String
    
    public init(aggregatedId: String) {
        self.aggregateId = aggregatedId
        self.eventId = UUID().uuidString
        self.occurredOn = Date().description
    }
    
    public init(aggregatedId: String, eventId: String, occurredOn: String) {
        self.aggregateId = aggregatedId
        self.eventId = eventId
        self.occurredOn = occurredOn
    }
    
    open func getTopic() -> String {
        ""
    }
    
    open func toPrimitives() -> [String: Codable] {
        [
            "aggregateId": aggregateId,
            "eventId": eventId,
            "occurredOn": occurredOn
        ]
    }
    
    open func fromPrimitives(aggregatedId: String,
                        body: [String: Codable],
                        eventId: String,
                        occurredOn: String) -> DomainEvent {
        DomainEvent(aggregatedId: aggregatedId, eventId: eventId, occurredOn: occurredOn)
    }
    
    open func getAggregateId() -> String {
        aggregateId
    }
    
    open func getEventId() -> String {
        eventId
    }
    
    open func getOccurredOn() -> String {
        occurredOn
    }
}
