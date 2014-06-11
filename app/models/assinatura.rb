class Assinatura < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :abaixo_assinado
  has_many :historico_de_assinaturas
end
