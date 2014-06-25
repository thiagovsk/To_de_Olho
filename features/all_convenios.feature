Feature: View Convenios
	In order to view the Convenios
	As an logged/unlogged Usuario
	You must access the page of Convenios

	

	@selenium
	Scenario: Access the Convenios page as a visitor
		Given I am on the root page
		When I follow "Todos Os Convenios"
		Then I should be on convenios page

	
	@selenium
	Scenario: Access details of Convenios
		Given I am on covenant_id page
		
	Scenario: teste
		Given I am on convenios page
		When I follow "Informações Adicionais"
		Then I should be on covenant_id page

	@selenium
	Scenario: Access the Convenios page as a logged Usuario
		Given I am on root page
		When I follow "Logar"
		Then I should be on sign-in page
		When I fill in the following:
		    | Login   |   root    |
			| Senha   | 123456789  |
		When I press "login"
		Then I should be on home page
		When I follow "Todos Os Convenios"
		Then I should be on convenios page

	@selenuim
	Scenario: Access the details of Convenios as a logged Usuario
		Given I am on root page
		When I follow "Logar"
		Then I should be on sign-in page
		When I fill in the following:
		    | Login   |   root     |
			| Senha   | 123456789  |
		When I press "login"
		Then I should be on sign-in page
		When I follow "Todos Os Convenios"
		Then I should be on convenios page
		When I follow "Informações Adicionais"
		Then I should be on covenant_id page
		