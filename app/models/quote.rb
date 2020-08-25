class Quote < ApplicationRecord
  belongs_to :user

  validates :title, :citation, :explanation, presence: true
end
