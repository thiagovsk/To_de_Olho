class UsersController < ApplicationController
before_action :set_user, only: [:show, :edit, :destroy, :update]

	def index
		@users = User.all
	end
	
	def new
		@user = User.new
	end


	private
		def set_user
			@users = User.find(params[:id])
		end


		def convenio_params
			params.require(:user).permit(:nome,:cpf, :email, :senha, :login)
		end 
end
