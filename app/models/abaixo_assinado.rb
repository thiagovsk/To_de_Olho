class AbaixoAssinado < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :convenio
  has_many :assinaturas

end
