#テーブル設計

## users テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| kanji_first_name | string   | null: false |
| kanji_last_name  | text     | null: false |
| kana_first_name  | text     | null: false |
| kana_last_name   | text     | null: false |
| birth_date       | datetime | null: false |

### Association

- has_many :comments
- has_many :items

## comments テーブル

| Column    | Type       | Options                         |
| --------- | ---------- | ------------------------------- |
| text      | text       | null: false                     |
| user      | references | null: false , foreign_key: true |
| item      | references | null: false , foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## items テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| title         | string     | null: false                     |
| explain       | text       | null: false                     |
| category      | string     | null: false                     |
| condition     | string     | null: false                     |
| price         | integer    | null: false                     |
| delivery_fee  | integer    | null: false                     |
| item_region   | string     | null: false                     |
| dispatch_date | datetime   | null: false                     |
| user          | references | null: false, foreign_key: true  |

### Association

- has_many :comments
- belongs_to :users