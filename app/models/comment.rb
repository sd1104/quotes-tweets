class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :quote

  validates :text, length: { in: 1..280 }
end
