class ReviewsController < ApplicationController
  before_action :find_game
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    review = @game.reviews.new(review_params.merge(user_id: current_user.id))
    if review.save
      redirect_to game_path(@game), notice: 'Review created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to game_path(@game), notice: 'Review updated'
    else
      redirect_to :edit
    end
  end

  def destroy
    @review.delete
    redirect_to game_path(@game), notice: 'Review deleted'
  end

  private
    def review_params
      params.require(:review).permit(:review, :rating)
    end

    def find_game
      @game = Game.find(params[:game_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
