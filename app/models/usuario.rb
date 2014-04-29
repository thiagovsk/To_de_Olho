class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates_presence_of :nome
	validates_presence_of :cpf
	validates_uniqueness_of :cpf
	validates_presence_of :email
	validates_presence_of :login
	validates_presence_of :senha
end
