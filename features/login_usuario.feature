Feature: Login Usuario
	In order to login on the website
	As a registered user
	Should fill the login and password field


	Before do |Usuario|
    Usuario.create{:nome => "Usuario teste", :cpf => "000.000.000-00",
     :email => "example@teste.com.br", :login => "Teste",
     :password => "1234567h",:password_confirmation => "1234567h"} 
    end

    @selenium
	Scenario: Login with valid params
	Given I am on root page
	When I fill in the following:
		| Usuário |   Teste  |
		| Senha   | 1234567h |
	When I press "login"
	Then I should be on sign-in page

	@selenium
	Scenario: Login with invalid params
	Given I am on root page
	When I fill in the following:
		| Usuário |   Teste  |
		| Senha   | 1234567h2 |
	When I press "login"
	Then I should be on sign-in page
