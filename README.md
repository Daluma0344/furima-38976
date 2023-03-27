# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false , unique:true|
| first_name         | string | null: false |
| second_name        | string | null: false |
| first_name_kana    | string | null: false |
| second_name_kana   | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :items
- has_many :purchase_recodes

## items テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| items_name           | string | null: false |
| item_description     | string | null: false |
| item_category_id     | string | null: false |
| item_condition_id    | string | null: false |
| shopping_charge_id   | string | null: false |
| area_id              | string | null: false |
| days_ship_id         | string | null: false |
| item_price           | string | null: false |
| user                 | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase_records

## purchase_recodes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shopping_infomation

## shopping_infomation テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| post_code            | string | null: false |
| area_id              | string | null: false |
| minicipalities       | string | null: false |
| house_number         | string | null: false |
| build_name           | string | null: false |
| telephone_number     | string | null: false |
| purchase_records     | references | null: false, foreign_key: true|

### Association

- belongs_to :purchase_records
