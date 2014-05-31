Feature: Create usuario
	In order to use the website features
	A visitor
	Should create a new account

	@selenium
	Scenario: Create a new account
		Given I am on root page
		When I follow "Cadastre-se"
		Then I should be on sign-up page

		When I fill in the following:
			|	Cpf			|	12345678900	|
			|	Nome		|	Nome_Teste	|
			|	Login		| 	Teste 		|
			|	Email		|teste@teste.com|
			|	Senha		|	12345678 	|
			|Confirmar Senha|	12345678	|

		When I press "criar-usuario"
		Then I should be on home page
		