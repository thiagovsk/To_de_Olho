# -*- encoding : utf-8 -*-

class HomeController < ApplicationController

  def new
    @convenios = Convenio.new
  end

  def index

  end

  def show
    @top_valor = Convenio.order("convenios.valorconvenio desc").limit(5)
    @top_data = Convenio.order('(convenios.datafimvigencia - convenios.datainiciovigencia) desc').limit(5)
    #@convenio = Convenio.find(params[:id])
    #respond_to do |format|
    #format.js { render :show }


  end

end
