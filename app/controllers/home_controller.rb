class HomeController < ApplicationController
  def index
    @games = Game.order(:name).page(params[:page]).per(2)
  end
end
