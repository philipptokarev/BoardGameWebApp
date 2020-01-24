class User < ApplicationRecord
  has_many :reviews
  has_many :ratings

  validates :login, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def admin?
    role == 'admin'
  end
end
