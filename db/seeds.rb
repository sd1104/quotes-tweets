require "csv"

CSV.foreach('db/csv/users.csv', headers: true) do |row|
  User.create(
    nickname: row['nickname'],
    email: row['email'],
    password: '9L8UZjqWYpckAj8Yn+7QxuHDNZ/5nVih68yxf2JUwIuGdwPimalsFJCZV+c3T15YoFmr/cJcEf78Kz+4UJno6w'
  )
end

CSV.foreach('db/csv/quotes.csv', headers: true) do |row|
  Quote.create(
    title: row['title'],
    citation: row['citation'],
    explanation: row['explanation'],
    user_id: row['user_id']
  )
end

CSV.foreach('db/csv/favorites.csv', headers: true) do |row|
  Favorite.create(
    user_id: row['user_id'],
    quote_id: row['quote_id']
  )
end

CSV.foreach('db/csv/relationships.csv', headers: true) do |row|
  Relationship.create(
    following_id: row['following_id'],
    follower_id: row['follower_id']
  )
end

CSV.foreach('db/csv/tags.csv', headers: true) do |row|
  Tag.create(
    id: row['id'],
    name: row['name']
  )
end

CSV.foreach('db/csv/quote_tags.csv', headers: true) do |row|
  QuoteTag.create(
    quote_id: row['quote_id'],
    tag_id: row['tag_id']
  )
end