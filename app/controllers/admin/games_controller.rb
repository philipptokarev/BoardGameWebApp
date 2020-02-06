class Admin::GamesController < Admin::BaseController
  before_action :find_game, only: %i[edit update destroy]
  def index
    @games = Game.order(sort_column + ' ' + sort_direction)
  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new(game_params)
    if game.save
      redirect_to admin_games_path, notice: 'Game added'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @game.update(game_params)
      redirect_to admin_games_path, notice: 'Game updated'
    else
      render :edit
    end
  end

  def destroy
    @game.destroy
    redirect_to admin_games_path, notice: 'Game deleted'
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

  def find_game
    @game = Game.find(params[:id])
  end
end
