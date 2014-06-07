# -*- encoding : utf-8 -*-

class HomeController < ApplicationController
  
  def new
  	@convenios = Convenio.new
  end
  
  def index
    
  end

  def show
      @convenios = Convenio.order("valorconvenio desc").limit(20)
      #@convenio = Convenio.find(params[:id])
      #respond_to do |format|
      #format.js { render :show }
    
    
  end

end
