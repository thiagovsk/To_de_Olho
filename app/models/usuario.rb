class Usuario < ActiveRecord::Base
	validates_presence_of :nome
	validates_presence_of :cpf
	validates_uniqueness_of :cpf
	validates_presence_of :email
	validates_presence_of :login
	validates_uniqueness_of :login
	validates_presence_of :senha
end
