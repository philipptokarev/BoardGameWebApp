class HomeController < ApplicationController
  def index
    @games = FindGame.new(Game.all).call(permitted_params)
  end
  private

  def permitted_params
    params.permit(:sort_column, :sort_direction, :game_count)
  end
end
