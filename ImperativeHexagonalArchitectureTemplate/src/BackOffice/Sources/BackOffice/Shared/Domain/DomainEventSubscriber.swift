//
//  DomainEventSubscriber.swift
//  ProyectoPorDefecto
//
//  Created by Javier Hernandez Sansalvador on 9/6/23.
//

import Foundation

public protocol DomainEventSubscriber {
    func consum(_ event: DomainEvent)
}
