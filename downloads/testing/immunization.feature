Feature: Validation of the immunizations given

@api
Scenario: return 422 when patient doses claimed does not equal patient doses
	Given I create Immunization immunization1
		And immunization1 has vaccineCode 123|Flutrax
		And I add immunization1 to the Claim
	Given I create Immunization immunization2
		And immunization2 has vaccineCode 123|Flutrax
		And I add immunization2 to the Claim
	Given I the Claim has 3 doses of 123|Flutrax
	When I submit the Claim
	Then the response code will be 422
		And the response resource should be OperationOutcome
		And the response issue details coding code should be 0021
		And the response issue details coding display should be "The total doses in the claim does not match the total doses recorded for patients"

@api
Scenario: return 422 when patient doses claimed does not equal patient doses
	Given I create Immunization immunization1
		And immunization1 has vaccineCode 123|Flutrax
		And I add immunization1 to the Claim
	Given I create Immunization immunization2
		And immunization2 has vaccineCode 123|Flutrax
		And I add immunization2 to the Claim
	Given I the Claim has 3 doses of 123|Flutrax
	When I submit the Claim
	Then the response code will be 422
		And the response resource should be OperationOutcome
		And the response issue details coding code should be 0021
		And the response issue details coding display should be "The total doses in the claim does not match the total doses recorded for patients"
