Feature: Login Usuario
	In order to login on the website
	As a registered user
	Should fill the login and password field


    #@selenium
	Scenario: Login with valid params
	Given I am on root page
	When I follow "Logar"
	Then I should be on sign-in page
	When I fill in the following:
		| Login   |   root  	|
		| Senha   | 123456789   |
	When I press "login"
	Then I should be on sign-in page

	#@selenium
	Scenario: Login with invalid params
	Given I am on root page
	When I follow "Logar"
	Then I should be on sign-in page
	When I fill in the following:
	    | Login   |   Teste   |
		| Senha   | 1234567h2 |
	When I press "login"
	Then I should be on sign-in page
