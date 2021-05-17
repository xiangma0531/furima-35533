# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | integer | null: false |

### Associations

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| image           |             |                                |
| name            | string      | null: false                    |
| explain         | text        | null: false                    |
| category_id     | integer     | null: false                    |
| status_id       | integer     | null: false                    |
| deli_change_id  | integer     | null: false                    |
| pref_id         | integer     | null: false                    |
| deli_days_id    | integer     | null: false                    |
| price           | integer     | null: false                    |
| user_id         | preferences | null: false, foreign_key: true |

### Associations

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column          | Type        | Options                        |
| --------------- | ----------- | ------------------------------ |
| postal_code     | integer     | null: false                    |
| pref_num        | integer     | null: false                    |
| city            | string      | null: false                    |
| address_num     | integer     | null: false                    |
| building        | string      | null: false                    |
| phone_num       | integer     | null: false                    |
| user_id         | preferences | null: false, foreign_key: true |
| item_id         | preferences | null: false, foreign_key: true |

### Associations

- belongs_to :user
- belongs_to :item