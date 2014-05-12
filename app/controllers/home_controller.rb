# -*- encoding : utf-8 -*-

class HomeController < ApplicationController
  def index
    @usuarios = Usuario.all
  end

  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.js { render :show }
    end
  end

end
