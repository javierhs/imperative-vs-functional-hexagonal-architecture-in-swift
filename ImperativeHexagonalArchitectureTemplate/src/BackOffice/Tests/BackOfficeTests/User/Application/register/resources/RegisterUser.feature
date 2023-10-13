Feature: Users can register to the application

Users can register to the application in order to visualize their TODO tasks list


Rule: User can register with an unidentified emaill.
	Scenario: User registers with an unidentified email
		Given an unidentified email by our system
		When user registers
		Then a user account is created

	Scenario: User registers with an identified email
		Given an identified email by our system
		When user registers
		Then an error indicating that the email is used by another client is raised.


Rule: User information supplied is not acceptable
	Scenario: User informs with no acceptable data
		Given a <no acceptable data> value
		When user registers
		Then an <error message> error is raised

		Examples:
		| 		description 	| 		no acceptable data 		| 				error message 					|
		| incorrect username	|		IncorrectUsername		|	Username lenght should be between 3 and 12  |
		| incorrect password	|		1234					|   Password lenght should be between 6 and 10  |
		| incorrect email 		|		incorrectemail			|	The introduced value is not an email 		|
