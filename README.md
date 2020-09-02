## QuoteTweets
Quoteを投稿し、共有するためのアプリです。  
![スクリーンショット 2020-08-30 21 10 10](https://user-images.githubusercontent.com/67669319/91658674-3da7ea80-eb05-11ea-891c-f0c8fc839f4a.png)

## アプリ紹介
Quoteとは引用という意味です。
文章を書いているときにちょっと洒落た言葉を引用したいけど何を使えばいいわからない時がよくある。
そんな時に、さっと引用文が参照できるアプリがあればいいと思って作りました。

##### 主な機能
- Quoteを閲覧できる。
- Quoteを投稿できる。
  - 詳細入力欄にハッシュタグをつけらる。
- Quoteを検索できる。
- Quoteにコメントを付けられる。
- 気に入ったQuoteをお気に入りに追加できる。
- 自分以外の投稿者をフォローできる。
- ユーザー登録をしてログインすればマイページができる。
  - お気に入り一覧
  - フォロー 一覧
  - フォロワー 一覧
  - 自身の投稿一覧
- レスポンシブデザイン対応

## ローカルでの使用方法
#### 1. Git-Hubからクローンする。
`$ git clone https://github.com/sd1104/quotes-tweets.git`
#### 2. bundleをインストールする。
`$ bundle install`
#### 3. データベースを作る。
`$ rails db:create`
#### 4. マイグレーションをする。
`$ rails db:migrate`
#### 5. 初期データを入れる。
`$ rails db:seed`
#### 6. ローカルサーバーを起動する。
`$　rails s`
#### 7. ブラウザに表示。
[http://localhost:3000/]をたたく。

## バージョン
ruby 2.6.5  
Rails 6.0.3.2  
