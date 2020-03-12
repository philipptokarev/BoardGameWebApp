class FindGame
  attr_reader :initial_scope

  def initialize(initial_scope)
    @initial_scope = initial_scope
  end

  def call(params)
    scoped = sort(initial_scope, params[:sort_column], params[:sort_direction])
    scoped = paginate(scoped, params[:game_count])
    scoped
  end

  private

  def sort(scoped, sort_column, sort_direction)
    sort_direction ||= :asc
    sort_column ||= :name
    scoped.order(sort_column => sort_direction)
  end

  def paginate(scoped, game_count)
    scoped.page().per(game_count)
  end
end
