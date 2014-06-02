class Reclamacao < ActiveRecord::Base
  belongs_to :convenio, :foreign_key => :convenio_id, class_name: 'Convenio'
  belongs_to :usuario, :foreign_key => :usuario_id, class_name: 'Usuario'
end
