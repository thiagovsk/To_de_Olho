class UsuarioController < ApplicationController

before_action :set_usuario , only:[:new , :create , :destroy ]

	def index 
		@usuarios = Usuario.all
	end

	def new
		@usuario = Usuario.new
	end

	def create
		@usuario = Usuario.new(usuario_params)

	end

	def destroy
		@usuario.destroy
	end

	private 
		def set_usuario 
			@usuario = Usuario.find(params[:id])
		end

		def usario_params
			params.require(:usuario).permit(:nome,:cpf,:email,:login,:senha)
		end
end
