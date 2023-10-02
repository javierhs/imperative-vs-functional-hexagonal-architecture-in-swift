//
//  CombineEventBusTestCase.swift
//  ProyectoPorDefectoTests
//
//  Created by Javier Hernandez Sansalvador on 9/6/23.
//

import XCTest
import BackOffice

@available(iOS 13.0, *)
final class CombineEventBusTestCase: XCTestCase {
    private var eventBus: EventBus?
    private var firstSubscriber: CombineSubscriber?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        eventBus = CombineEventBus()
        firstSubscriber = CombineSubscriber()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        eventBus = nil
        firstSubscriber = nil
    }

    func testSubscriberIsNotifiedWhenEventPublished() throws {
        givenASubscriberThatIsRegisteredInTheCombineEventBus()
        whenAnEventIsFired()
        thenHeIsNotified()
    }
    
    private func givenASubscriberThatIsRegisteredInTheCombineEventBus() {
        eventBus!.register(firstSubscriber!, for: "MyCombineEvent")
    }
    
    private func whenAnEventIsFired() {
        eventBus!.publish(MyCombineEvent(aggregatedId: "1", eventId: "1", occurredOn: "00:00:00"))
    }
    
    private func thenHeIsNotified() {
        XCTAssertEqual(
            firstSubscriber!.numberOfTimesConsumMethodCalled,
            1,
            "ERROR: No se notificó al primer subscriber"
        )
    }
    
    private class CombineSubscriber: DomainEventSubscriber {
        var numberOfTimesConsumMethodCalled: Int = 0
        
        func consum(_ event: DomainEvent) {
            numberOfTimesConsumMethodCalled += 1
        }
    }
    
    private class MyCombineEvent: DomainEvent {
        var aggregateId: String
        
        var eventId: String
        
        var occurredOn: String
        
        required init(aggregatedId: String, eventId: String, occurredOn: String) {
            self.aggregateId = aggregatedId
            self.eventId = eventId
            self.occurredOn = occurredOn
        }
        
        func getTopic() -> String {
            "MyCombineEvent"
        }
        
        func toPrimitives() -> [String : Codable] {
            [:]
        }
        
        func fromPrimitives(aggregatedId: String, body: [String : Codable], eventId: String, occurredOn: String) -> DomainEvent {
            MyCombineEvent(aggregatedId: aggregatedId, eventId: eventId, occurredOn: occurredOn)
        }
    }
}
