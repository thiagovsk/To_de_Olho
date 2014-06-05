Feature: Edit user
	In order to edit user
	As an logged Usuario
	You must edit your information


	Before do |Usuario|
    Usuario.create{:nome => "Usuario teste", :cpf => "000.000.000-00",
     :email => "example@teste.com.br", :login => "Teste",
     :password => "1234567h",:password_confirmation => "1234567h"} 
    end


    @selenium
    Scenario: Edit user
    	Given I am on home page
    	When I press "Usuario"
    	And I follow "Editar perfil"
    	Then I should be on edit page

