class Item < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id
    validates :status_id
    validates :deli_change_id
    validates :pref_id
    validates :deli_days_id
    validates :price
  end
end
