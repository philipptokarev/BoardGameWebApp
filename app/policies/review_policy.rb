class ReviewPolicy
  attr_reader :user, :review

  def initialize(user, review)
    @user = user
    @review = review
  end

  def manage?
    user.id == review.user_id
  end

  def delete?
    user.id == review.user_id
  end
end
