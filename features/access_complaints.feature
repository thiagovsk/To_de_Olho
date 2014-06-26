Feature: Access the Complaints of a covenant
	As an User
	I want to see the complaints of a covenant
	In order to know the real situation of them

	Scenario: Access the page of the complaints
		Given I am on root page
		When I follow "Reclamações"
		Then I should be on reclamacoes page

	Scenario: Access a specific complaint
		Given I am on reclamacoes page
		When I follow "Sobre"
		Then I should be on reclamacoes_id page

	Scenario: Access the page of a specific convenio through a complaint
		Given I am on reclamacoes_id page
		When I follow "Convênio!!"
		Then I should be on covenant_id page

	Scenario: Back to the complaints page
		Given I am on reclamacoes_id page
		When I follow "Voltar"
		Then I should be on reclamacoes page

	Scenario: Share the complaints page
		Given I am on reclamacoes_id page
		When I follow "Compartilhar Reclamação"
		Then I should be on reclamacao_facebook_share page
		When I press "Compartilhar link"
		Then I should be on reclamacoes_id page
