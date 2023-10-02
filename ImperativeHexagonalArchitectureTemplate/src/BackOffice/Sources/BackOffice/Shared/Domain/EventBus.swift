//
//  EventBus.swift
//  ProyectoPorDefecto
//
//  Created by Javier Hernandez Sansalvador on 9/6/23.
//

import Foundation

public protocol EventBus {
    func publish(_ events: DomainEvent...)
    func register(_ subscriber: DomainEventSubscriber, for topic: String)
}
