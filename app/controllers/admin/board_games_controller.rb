class Admin::BoardGamesController < Admin::BaseController
  def index
    @games = Game.order(sort_column + ' ' + sort_direction)
  end

  private
    def sort_column
      params[:sort] ||= 'name'
    end

    def sort_direction
      params[:direction] ||= 'desc'
    end
end
