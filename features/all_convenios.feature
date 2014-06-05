Feature: View Convenios
	In order to view the Convenios
	As an logged/unlogged Usuario
	You must access the page of Convenios

	@selenium
	Scenario: Access the Convenios page as a visitor
		Given I am on the root page
		When I follow "Veja todos os Convênios"
		Then I should be on convenios page

	
	@selenium
	Scenario: Access details of Convenios
		Given I am on the convenios page
		When I follow "Informações Adicionais"
		Then I should be on convenios page + id ?
