class Quote < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :comments
  has_many :quote_tags, dependent: :destroy
  has_many :tags, through: :quote_tags

  validates :title, :citation, :explanation, presence: true
  validates :title, length: { in: 1..50 }
  validates :citation, length: { in: 1..50 }
  validates :explanation, length: { in: 1..280 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  after_create do
    @quote = Quote.find_by(id: self.id)
    tags  = self.explanation.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |t|
      tag = Tag.find_or_create_by(name: t.downcase.delete('#'))
      @quote.tags << tag
    end
  end

  before_update do 
    @quote = Quote.find_by(id: self.id)
    @quote.hashtags.clear
    tags  = self.explanation.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    tags.uniq.map do |t|
      tag = Tag.find_or_create_by(name: t.downcase.delete('#'))
      @quote.tags << tag
    end
  end

  def self.search(keyword)
    Quote.where('(title LIKE(?)) OR (citation LIKE(?)) OR (explanation LIKE(?))', "%#{keyword}}%", "%#{keyword}%", "%#{keyword}%")
  end 
end
