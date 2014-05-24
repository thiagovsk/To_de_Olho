class Role < ActiveRecord::Base
  has_and_belongs_to_many :usuario, :join_table => :usuario_roles
  belongs_to :resource, :polymorphic => true
  
  scopify
end
