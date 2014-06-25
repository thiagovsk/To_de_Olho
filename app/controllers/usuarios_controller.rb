# -*- encoding : utf-8 -*-

class UsuariosController < ApplicationController
  before_action :authenticate_usuario!

  load_and_authorize_resource
  check_authorization

  before_action :set_usuario , only:[:show, :edit, :destroy, :update]

  def index
    @usuarios = Usuario.all
  end

  def new
    @usuarios = Usuario.new
  end

  def show
    if params[:id]
      @usuarios = Usuario.find(params[:id])
    else
      @usuarios = current_usuario
    end
  end

  def create
    @usuarios = Usuario.new(usuario_params)
    respond_to do |format|
      if @usuarios.save
        format.html { redirect_to usuarios_path, notice: 'Usuário Cadastrado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end


  def destroy
    @usuarios.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_path, notice: 'Deletado com sucesso' }
    end
  end

  def update
    respond_to do |format|
      if @usuarios.update(usuario_params)
        format.html { redirect_to usuarios_path, notice: 'Alteração realizada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def set_usuario
    @usuarios = Usuario.find(params[:id])
  end

  def usuario_params
    params.fetch(:usuario, {}).permit(:nome,:cpf,:email,:login,:avatar)
    #Ao invés de utilizar params.require, utilize params.fetch
    #Esse problema é intrínseco ao Rails e é solucionado com o fetch
  end
end
