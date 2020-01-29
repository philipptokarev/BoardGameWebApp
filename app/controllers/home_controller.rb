class HomeController < ApplicationController
  def index
    @games = Game.limit(20).order(:name).page(params[:page]).per(2)
  end
end
