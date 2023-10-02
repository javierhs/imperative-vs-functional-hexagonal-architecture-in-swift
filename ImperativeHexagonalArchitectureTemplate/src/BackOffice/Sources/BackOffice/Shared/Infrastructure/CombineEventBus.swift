//
//  CombineEventBus.swift
//  ProyectoPorDefecto
//
//  Created by Javier Hernandez Sansalvador on 9/6/23.
//

import Foundation
import Combine

@available(iOS 13.0, *)
public final class CombineEventBus: EventBus {
    private var registeredSubscribers: [String: [AnyCancellable]] = [:]
    private var publisher: PassthroughSubject<DomainEvent, Error> = PassthroughSubject<DomainEvent, Error>()
    
    public init() { }
    
    public func publish(_ events: DomainEvent...) {
        for event in events {
            publisher.send(event)
        }
    }

    public func register(_ subscriber: DomainEventSubscriber, for topic: String) {
        if registeredSubscribers[topic] == nil {
            registeredSubscribers[topic] = []
        }
        
        registeredSubscribers[topic]?.append(
            publisher.sink { completion in
            switch completion {
            case .finished:
                print("Consumido")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { event in
            subscriber.consum(event)
        })
    }
}
