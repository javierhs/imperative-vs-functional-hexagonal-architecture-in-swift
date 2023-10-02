//
//  Event.swift
//  ProyectoPorDefecto
//
//  Created by Javier Hernandez Sansalvador on 9/6/23.
//

import Foundation

public protocol DomainEvent {
    var aggregateId: String { get }
    var eventId: String { get }
    var occurredOn: String { get }
    init(aggregatedId: String, eventId: String, occurredOn: String)
    func getTopic() -> String
    func toPrimitives() -> [String: Codable]
    func fromPrimitives(aggregatedId: String,
                        body: [String: Codable],
                        eventId: String,
                        occurredOn: String) -> DomainEvent
}
