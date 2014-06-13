class Assinatura < ActiveRecord::Base
belongs_to :usuario
belongs_to :abaixo_assinado
end
