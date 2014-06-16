class Assinatura < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :abaixo_assinado

	validates_uniqueness_of :usuario_id, scope: :abaixo_assinado_id

	def self.search(query)
    	where("abaixo_assinado_id like ?", "%#{query}%")
  	end
end
