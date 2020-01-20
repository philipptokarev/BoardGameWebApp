class Admin::BoardGamesController < Admin::BaseController
  def index
    @games = Game.order(sort_column + ' ' + sort_direction)
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    if game.save
      flash[:success] = "Game added"
      redirect_to admin_board_games_path
    else
      render :new
    end
  end

  def edit
    begin
      @game = Game.find(params[:id])
    rescue
      flash[:error] = 'Game not found'
      redirect_to admin_board_games_path
    else
      @game
    end
  end

  def update
    game = Game.find(params[:id])
    if game.update_attributes(game_params)
      flash[:success] = "Game updated"
      redirect_to admin_board_games_path
    else
      redirect_to edit_admin_board_game_path(game)
    end
  end

  def destroy
    Game.find(params[:id]).destroy
    flash[:success] = "Game deleted"
    redirect_to admin_board_games_path
  end

  private
    def sort_column
      params[:sort] ||= 'name'
    end

    def sort_direction
      params[:direction] ||= 'asc'
    end

    def game_params
      params.require(:game).permit(:name, :description, :video, :reference, :image)
    end
end
