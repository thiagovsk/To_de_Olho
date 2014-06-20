class Reclamacao < ActiveRecord::Base
  belongs_to :convenio, :foreign_key => :convenio_id, class_name: 'Convenio'
  belongs_to :usuario, :foreign_key => :usuario_id, class_name: 'Usuario'
  has_attached_file :foto, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "url.png"
  validates_attachment_content_type :foto, :content_type => /\Aimage\/.*\Z/

end
