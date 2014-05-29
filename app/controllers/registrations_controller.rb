class Usuarios::RegistrationsController < Devise::RegistrationsController]
	protected
	def after_update_path_for(resources)
		home_index_path(resources)	
	end	
end
