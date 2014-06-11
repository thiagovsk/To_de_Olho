class AbaixoAssinado < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :convenio
  has_many :usuarios
  has_many :assinaturas
  has_one :hitorico_de_assinatura 
end
