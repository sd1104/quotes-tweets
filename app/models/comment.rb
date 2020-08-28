class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :quote

  validates :text, length: { in: 1..280 }

  def created_at
    attributes['created_at'].strftime("%Y/%m/%d")
  end
end
