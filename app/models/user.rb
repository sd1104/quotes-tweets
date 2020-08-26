class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :quotes
  has_many :favorites
  has_many :favorite_quotes, through: :favorites, source: :quote

  validates :nickname, presence: true
end
