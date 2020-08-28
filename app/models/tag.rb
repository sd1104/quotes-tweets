class Tag < ApplicationRecord
  has_many :quote_tags, dependent: :destroy
  has_many :quotes, through: :quote_tags

  validates :name, presence: true, length: {maximum:20}
end
