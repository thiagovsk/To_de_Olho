class Reclamacao < ActiveRecord::Base
  belongs_to :convenio, :foreign_key => :convenio_id
end
