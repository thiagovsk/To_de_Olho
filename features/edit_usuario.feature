Feature: Edit user
	In order to edit user
	As an logged Usuario
	You must edit your information

    #@selenium
    Scenario: Edit user
        Given I am on root page
        When I follow "Logar"
        Then I should be on sign-in page
        When I fill in the following:
            | Login   |   root      |
            | Senha   | 123456789   |
        When I press "login"
        Then I should be on home page
    	When I press "Usuario"
    	And I follow "Editar perfil"
    	Then I should be on edit page

