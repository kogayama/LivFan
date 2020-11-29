# README
## photographerテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_one: profile

## usersテーブル
|Column|Type|Option|
|:-------|:------|:--------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_one: profile

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
