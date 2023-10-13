//
//  InMemoryEventBusTestCase.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import XCTest
import BackOffice

final class InMemoryEventBusTestCase: XCTestCase {
    private var eventBus: EventBus?
    private var firstSubscriber: MySubscriber?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        eventBus = InMemoryEventBus()
        firstSubscriber = MySubscriber()
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
        eventBus!.register(firstSubscriber!, for: "MyInMemoryEvent")
    }
    
    private func whenAnEventIsFired() {
        eventBus!.publish(MyInMemoryEvent(aggregatedId: "1", eventId: "1", occurredOn: "00:00:00"))
    }
    
    private func thenHeIsNotified() {
        XCTAssertEqual(
            firstSubscriber!.numberOfTimesConsumMethodCalled,
            1,
            "ERROR: No se notificó al primer subscriber"
        )
    }
    
    private class MySubscriber: DomainEventSubscriber {
        var numberOfTimesConsumMethodCalled: Int = 0
        
        func consum(_ event: DomainEvent) {
            numberOfTimesConsumMethodCalled += 1
        }
    }
    
    private class MyInMemoryEvent: DomainEvent {        
        override init(aggregatedId: String, eventId: String, occurredOn: String) {
            super.init(aggregatedId: aggregatedId, eventId: eventId, occurredOn: occurredOn)
        }
        
        override func getTopic() -> String {
            "MyInMemoryEvent"
        }
        
        override func fromPrimitives(
            aggregatedId: String,
            body: [String : Codable],
            eventId: String,
            occurredOn: String
        ) -> DomainEvent {
            MyInMemoryEvent(aggregatedId: aggregatedId, eventId: eventId, occurredOn: occurredOn)
        }
    }
}
