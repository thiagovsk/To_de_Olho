Feature: Create usuario
	In order to use the website features
	A visitor
	Should create a new account

	@selenium
	Scenario: Create a new account with valid params
		Given I am on root page
		When I follow "Criar Conta"
		Then I should be on sign-up page

		When I fill in the following:
			|	CPF			  |	  12345678900	|
			|	Nome		  |   Nome_Teste	|
			|	Login  		  | 	Teste 		|
			|	Email		  | teste@teste.com |
			|	Senha		  |	  12345678 	    |
			| Confirmação de Senha | 12345678   |
			
		When I press "criar-usuario"
		Then I should be on usuarios page
		
	@selenium
	Scenario: Cancel a new account on registration
		Given I am on root page
		When I follow "Criar Conta"
		Then I should be on sign-up page

		When I fill in the following:
			|	CPF			  |	  12345678900	|
			|	Nome		  |   Nome_Teste	|
			|	Login  		  | 	Teste 		|
			|	Email		  | teste@teste.com |
			|	Senha		  |	  12345678 	    |
			| Confirmação de Senha | 12345678   |

		When I follow "Cancelar"
		Then I should be on root page

	@selenium
	Scenario: Create a new account with invalid params
		Given I am on root page
		When I follow "Criar Conta"
		Then I should be on sign-up page

		When I fill in the following:
			|	CPF			  |	  1234aaa8900	|
			|	Nome		  |   Nome_Teste	|
			|	Login  		  | 	Teste 		|
			|	Email		  | testeteste.com  |
			|	Senha		  |	  12378 	    |
			| Confirmação de Senha | 345678	    |

		When I press "criar-usuario"
		Then I should be on usuarios page


	