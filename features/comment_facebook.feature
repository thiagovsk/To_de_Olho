Feature: Comment on facebook
	In order to show a comment to my facebook friends
	As a visitor
	I want comment a complaint

	
	Scenario: Go to complaints details page
		Given I am on reclamacoes page
		When I follow "Informações Adicionais"
		Then I should be on reclamacoes_id page.

		
