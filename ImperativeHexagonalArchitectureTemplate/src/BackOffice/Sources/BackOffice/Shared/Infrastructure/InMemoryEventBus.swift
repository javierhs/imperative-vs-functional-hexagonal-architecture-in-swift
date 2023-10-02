//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import Foundation

public final class InMemoryEventBus: EventBus {
    private var registeredSubscribers: [String: [DomainEventSubscriber]] = [:]
    
    public init() { }
    
    public func publish(_ events: DomainEvent...) {
        for event in events {
            if let subscribers = registeredSubscribers[event.getTopic()] {
                for subscriber in subscribers {
                    subscriber.consum(event)
                }
            }
        }
    }
    
    public func register(_ subscriber: DomainEventSubscriber, for topic: String) {
        if registeredSubscribers[topic] == nil {
            registeredSubscribers[topic] = []
        }
        
        registeredSubscribers[topic]?.append(subscriber)
    }
    
}
