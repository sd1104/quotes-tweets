class Quote < ApplicationRecord
  belongs_to :user

  validates :title, :citation, :explanation, presence: true
  validates :title, length: { in: 1..50 }
  validates :citation, length: { in: 1..50 }
  validates :explanation, length: { in: 1..280 }
end
