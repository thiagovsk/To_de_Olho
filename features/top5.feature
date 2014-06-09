Feature: Show TOP 5
	As an User
	I want to see the most expensive covernants.
	So that view covenants that may draw more attention to complaints

	@selenium
	Scenario: There are covenants and I want to see the most expensive.
		Given I an on home page
		When I follow TOP 5
		Then I should be on show_5 page
		And I can see the most expensive covenants

	@selenium
	Scenario 2: There are no covenants imported
		Given I an on home page
		When I follow TOP 5
		Then I should be on show_5 page
		And I can see the message error " Não existem convênios importados"	