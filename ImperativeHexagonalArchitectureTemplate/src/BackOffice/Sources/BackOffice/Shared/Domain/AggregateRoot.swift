//
//  AggregateRoot.swift
//  ProyectoPorDefecto
//
//  Created by Javier Hernandez Sansalvador on 9/6/23.
//

import Foundation

public class AggregateRoot {
    private var events: [DomainEvent] = []
    
    public func record(listEvents: DomainEvent...) {
        for event in listEvents {
            events.append(event)
        }
    }
    
    public func pullRecordedEvents() -> [DomainEvent] {
        let eventsStored = events.map { $0 }
        events.removeAll()
        return eventsStored
    }
}
