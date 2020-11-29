# README

## usersテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_one: profile
- has_many: rooms, :dependent => :destroy
- has_many: sold_items, -> { where("buyer_id is not NULL"), foreign_key: "seller_id", class_name: "item"
- has_many :selling_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "item"
- has_many: bought_items, foreign_key: "buyer_id", class_name: "item"

## profilesテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|date|null: false|
|introduction|string||
|avatar|string||
|user|references|null: false, foreign_key: true|
### Association
- belongs_to: user

## roomsテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|category_id|integer|null: false|
|brand_id|integer|null: false|
|condition_id|integer|null: false|
|shipping_date_id|integer|null: false|
|delivery_source_area_id|integer|null: false|
|postage_id|integer|null: false|
### Association
- has_many: room_images
- has_many: room_items
- belongs_to_active_hash: category
- belongs_to_active_hash: brand
- belongs_to_active_hash: condition
- belongs_to_active_hash: shipping_date
- belongs_to_active_hash: delivery_source_area
- belongs_to_active_hash: postage

## room_imagesテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|src|string|null: false|
|room|references|null: false, foreign_key: true|
### Association
- belongs_to: room

## room_itemsテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|category_id|integer|null: false|
|brand_id|integer|null: false|
|condition_id|integer|null: false|
|shipping_date_id|integer|null: false|
|delivery_source_area_id|integer|null: false|
|postage_id|integer|null: false|
|room|references|null: false, foreign_key: true|
### Association
- has_many: room_item_images

## room_item_imagesテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|src|string|null: false|
|room_item|references|null: false, foreign_key: true|
### Association
- belongs_to: room_item

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
