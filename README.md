# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|integer|null: false|
|phone|integer||
|kanji_family|string|null: false|
|kanji_name|string|null: false|
|katakana_family|string|null: false|
|katakana_name|string|null: false|
### Association
- has_one :address
- has_many :cards
- has_many :products
- has_many :comments
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|post|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|house|integer|null: false|
|building_name|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null :false|
|number|integer|null :false|
|security|integer|null :false|
### Association
- belongs_to :user
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|detail|text|null: false|
|brand|string||
|size|string||
|price|string|null:false|
|status|string|null: false|
|situation|string|null: false|
|postage|integer|null: false|
|method|string|null: false|
|area|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments
- has_many :images
- belongs_to :categories_tree
## a_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
### Association
- belongs_to :categories_tree
## b_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
### Association
- belongs_to :categories_tree
## c_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|b_categories_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :categories_tree
## categories_treeテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|integer|null: false, foreign_key: true|
|a_categories_id|integer|null: false, foreign_key: true|
|b_categories_id|integer|null: false, foreign_key: true|
|c_categories_id|integer|null: false, foreign_key: true|
### Association
- has_many :products
- has_many :a_categories
- has_many :b_categories
- has_many :c_categories
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :product
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product

# hello world!!