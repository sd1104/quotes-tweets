class Quote < ApplicationRecord
  belongs_to :user
  has_many :favorites


  validates :title, :citation, :explanation, presence: true
  validates :title, length: { in: 1..50 }
  validates :citation, length: { in: 1..50 }
  validates :explanation, length: { in: 1..280 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
