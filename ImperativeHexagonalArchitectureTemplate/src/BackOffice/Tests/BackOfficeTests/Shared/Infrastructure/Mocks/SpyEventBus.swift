//
//  SpyEventBus.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 12/10/23.
//

import Foundation
import BackOffice

final class SpyEventBus: EventBus {
    var numberOfTimesPublishMethodCalled = 0
    var numberOfTimesRegisterMethodCalled = 0
    
    func publish(_ events: DomainEvent...) {
        numberOfTimesPublishMethodCalled += 1
    }
    
    func register(_ subscriber: DomainEventSubscriber, for topic: String) {
        numberOfTimesRegisterMethodCalled += 1
    }
}
