//
//  RegisterUserUseCaseTest.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/10/23.
//

import XCTest
import BackOffice

final class RegisterUserUseCaseTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    //MARK: - User can register with an unidentified email
    func testUserCanRegisterWithAnUnidentifiedEmail() throws {
        //Given an unidentified email by our system
        let request = RegisterUserRequestMother.randomRegisterUserRequestWithCorrectData()
        let userRepository = SuccessSpyUserRepository()
        let eventBus = SpyEventBus()
        let registerUserUseCase = RegisterUserUseCase(repository: userRepository, eventBus: eventBus)
        
        //When user registers
        try registerUserUseCase.invoke(request: request) { result in
            switch result {
            case .failure(let error):
                XCTFail(
                    """
                        ERROR: The user could not be registered in the repository.
                        Error message: \(error)
                    """
                )
            case .success(_):
                //Then a user account is created
                XCTAssertEqual(
                    userRepository.numberOfTimesRegisterMethodCalled,
                    1,
                    """
                        ERROR: Number of times login method called: \(userRepository.numberOfTimesRegisterMethodCalled).
                        Expected times: 1
                    """
                )
            }
        }
    }
    
    // MARK: - User cannot register with an identified email
    func testUserCanNotRegisterWithAnIdentifiedEmail() throws {
        //Given an identified email by our system
        let request = RegisterUserRequestMother.randomRegisterUserRequestWithCorrectData()
        let userRepository = FailureSpyUserRepository(
            error: UserAlreadyRegisteredError(
                message: "User with email \(request.email) already registered."
            )
        )
        let eventBus = SpyEventBus()
        let registerUserUseCase = RegisterUserUseCase(repository: userRepository, eventBus: eventBus)
        
        //When user registers
        try registerUserUseCase.invoke(request: request) { result in
            switch result {
            case .success(_):
                XCTFail("ERROR: User with email \(request.email) registered again.")
            case .failure(let error):
                //Then an error indicating that the email is used by another client is raised.
                XCTAssertTrue(error is UserAlreadyRegisteredError)
            }
        }
    }
    
    // MARK: - Username supplied is not acceptable
    func testUserSuppliesAnInvalidUsername() throws {
        //Given an invalid username value
        let request = RegisterUserRequestMother.randomRegisterUserRequestWithInvalidUsernameData()
        let userRepository = SuccessSpyUserRepository()
        let eventBus = SpyEventBus()
        let registerUserUseCase = RegisterUserUseCase(repository: userRepository, eventBus: eventBus)
        
        //When user registers
        do {
            try registerUserUseCase.invoke(request: request) { result in
                XCTFail("ERROR: User registered with an invalid username")
            }
        } catch let error {
            //Then an invalid username length error is raised.
            XCTAssertTrue(error is InvalidUsernameLengthError)
        }
    }
    
    // MARK: - Password supplied is not acceptable
    func testUserSuppliesAnInvalidPassword() throws {
        //Given an invalid password value
        let request = RegisterUserRequestMother.randomRegisterUserRequestWithInvalidPassword()
        let userRepository = SuccessSpyUserRepository()
        let eventBus = SpyEventBus()
        let registerUserUseCase = RegisterUserUseCase(repository: userRepository, eventBus: eventBus)
        
        //When user registers
        do {
            try registerUserUseCase.invoke(request: request) { result in
                XCTFail("ERROR: User registered with an invalid password")
            }
        } catch let error {
            //Then an invalid password length error is raised.
            XCTAssertTrue(error is InvalidPasswordLengthError)
        }
    }
    
    // MARK: - Email supplied is not acceptable
    func testUserSuppliesAnInvalidEmail() throws {
        //Given an invalid email value
        let request = RegisterUserRequestMother.randomRegisterUserRequestWithInvalidEmail()
        let userRepository = SuccessSpyUserRepository()
        let eventBus = SpyEventBus()
        let registerUserUseCase = RegisterUserUseCase(repository: userRepository, eventBus: eventBus)
        
        //When user registers
        do {
            try registerUserUseCase.invoke(request: request) { result in
                XCTFail("ERROR: User registered with an invalid email")
            }
        } catch let error {
            //Then an invalid password length error is raised.
            XCTAssertTrue(error is InvalidEmailError)
        }
    }
    
    // MARK: - User registered domain event is published
    func testUserRegisteredDomainEventIsPublished() throws {
        //Given an unidentified email by our system
        let request = RegisterUserRequestMother.randomRegisterUserRequestWithCorrectData()
        let userRepository = SuccessSpyUserRepository()
        let eventBus = SpyEventBus()
        let registerUserUseCase = RegisterUserUseCase(repository: userRepository, eventBus: eventBus)
        
        //When user registers
        try registerUserUseCase.invoke(request: request) { result in
            switch result {
            case .failure(let error):
                XCTFail(
                    """
                        ERROR: The user could not be registered in the repository.
                        Error message: \(error)
                    """
                )
            case .success(_):
                //Then a user account is created
                XCTAssertEqual(
                    eventBus.numberOfTimesPublishMethodCalled,
                    1,
                    """
                        ERROR: Number of times publish method called: \(eventBus.numberOfTimesPublishMethodCalled).
                        Expected times: 1
                    """
                )
            }
        }
    }
}
