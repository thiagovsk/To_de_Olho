# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Usuario.create([{:nome => "Usuario teste", :cpf => "000.000.000-00", :email => "example@teste.com.br",
				 :login => "root", :password => "123456789", :password_confirmation => "123456789"}])
Usuario.last.add_role(:admin)

Convenio.create([{:id => 1, :numeroconvenio => "900037",
   :uf => "SC", :codigosiafi => "8255", :nomemunicipio => "Brasilia",
   :situacaoconvenio => "Em execucao", :numerooriginal => "05520/2009",
   :objetoconvenio => "Pavimentacao", :codigoorgaosuperior => "22000",
   :nomeorgaosuperior => "MINIST. DA AGRICUL..PECUARIA E ABASTECIMENTO ",
   :codigoconcedente => "135098", :nomeconcedente => "CAIXA ECONOMICA FEDERAL/MA ",
   :codigoconvenente => "82827148000169", :nomeconvenente => "MUNICIPIO DE PINHEIRO PRETO ",
   :tipoenteconvenente => "'M' (municipal)", :valorconvenio => "97500.00",
   :valorliberado => "97500.00", :datapublicacao => "2010-01-28", :datainiciovigencia => "2009-12-31",
   :datafimvigencia => "2014-12-31 ", :valorcontrapartida => "19690.29 ",
   :dataultimaliberacao => "2011-12-28", :valorultimaliberacao => "97500.00",
   :created_at => "2010-10-20", :updated_at => "2013-10-25"}])


