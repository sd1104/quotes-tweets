class Quote < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :comments
  has_many :quote_tags
  has_many :tags, through: :quote_tags

  validates :title, :citation, :explanation, presence: true
  validates :title, length: { in: 1..50 }
  validates :citation, length: { in: 1..50 }
  validates :explanation, length: { in: 1..280 }

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  after_create do
    #1.controller側でcreateしたquoteを取得
    @quote = Quote.find_by(id: self.id)
    #2.正規表現を用いて、quoteのtext内から『#○○○』の文字列を検出qu
    tags  = self.explanation.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    #3.mapメソッドでtags配列の要素一つ一つを取り出して、先頭の#を取り除いてDBへ保存する
    tags.uniq.map do |t|
      tag = Tag.find_or_create_by(name: t.downcase.delete('#'))
      @quote.tags << tag
    end
  end

end
