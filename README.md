#テーブル設計

## users テーブル

| Column                     | Type     | Options                   |
| -------------------------- | -------- | ------------------------- |
| nickname                   | string   | null: false               |
| email                      | string   | null: false, unique: true |
| encrypted_password         | string   | null: false               |
| kanji_first_name           | string   | null: false               |
| kanji_last_name            | string   | null: false               |
| kana_first_name            | string   | null: false               |
| kana_last_name             | string   | null: false               |
| birth_date                 | date     | null: false               |

### Association

- has_many :order
- has_many :items

## items テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| title            | string     | null: false                     |
| explain          | text       | null: false                     |
| category_id      | integer    | null: false                     |
| condition_id     | integer    | null: false                     |
| price            | integer    | null: false                     |
| delivery_fee_id  | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     |
| delivery_date_id | integer    | null: false                     |
| user             | references | null: false, foreign_key: true  |

### Association

- has_one :order
- belongs_to :user

## order テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :item
has_one :address

## address テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city_name       | string     | null: false                    |
| house_number    | integer    | null: false                    |
| tel_number      | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

belongs_to :order