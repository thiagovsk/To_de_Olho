# -*- encoding : utf-8 -*-

class HomeController < ApplicationController

  def new
    @convenios = Convenio.new
  end

  def index
    respond_to do |format|
      if !current_usuario
        format.html { redirect_to root_path, alert: 'Você precisa logar para acessar essa página' }
      else
        format.html
      end
    end
  end

  def show
    @top_valor = Convenio.order("convenios.valorconvenio desc").limit(5)
    @top_data = Convenio.order('(convenios.datafimvigencia - convenios.datainiciovigencia) desc').limit(5)
    #@convenio = Convenio.find(params[:id])
    #respond_to do |format|
    #format.js { render :show }


  end

end
