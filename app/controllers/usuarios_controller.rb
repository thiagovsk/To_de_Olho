class UsuariosController < ApplicationController

before_action :set_usuario , only:[:show, :edit, :destroy, :update]

	def index 
		@usuarios = Usuario.all
	end

	def new
		@usuarios = Usuario.new
	end

	def create
		@usuarios = Usuario.new(usuario_params)
		respond_to do |format|
  		if @usuarios.save
  			format.html { redirect_to new_usuario_path, notice: 'Usuário Cadastrado com sucesso' }
 		else
  			format.html { render :new }
  		 end
  		end
	end

	def show

	end

	def edit
		
	end

	def destroy
		@usuarios.destroy
	end

	def update
		
	end

	private 
		def set_usuario 
			@usuarios = Usuario.find(params[:id])
		end

		def usuario_params
			params.require(:usuario).permit(:nome,:cpf,:email,:login,:senha)
		end
end