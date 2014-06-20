Feature: Show TOP 5
	As an User
	I want to see the most expensive covenants.
	So that view covenants that may draw more attention to complaints

	
	Scenario: There are covenants and I want to see the most expensive.
		Given I am on home page
		When I follow "Top 5"
		Then I should be on show_5 page
		And I can see the most expensive covenants

	
	Scenario: No covenants
		Given I am on home page
		When I follow "Top 5"
		Then I should be on show_5 page
		And I can see the message error " Não existem convênios importados"	