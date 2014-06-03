Feature: Create usuario
	In order to use the website features
	A visitor
	Should create a new account

	@selenium
	Scenario: Create a new account with valid params
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
		
	@selenium
	Scenario: Cancel a new account on registration
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

		When I follow "Cancelar"
		Then I should be on root page

	@selenium
	Scenario: Create a new account with invalid params
		Given I am on root page
		When I follow "Cadastre-se"
		Then I should be on sign-up page

		When I fill in the following:
			|	Cpf			|	123456789	|
			|	Nome		|	Nome_Teste	|
			|	Login		| 	Teste 		|
			|	Email		|	teste 		|
			|	Senha		|	1234 		|
			|Confirmar Senha|	1234 		|

		When I press "criar-usuario"
		Then I should be on usuarios page


	