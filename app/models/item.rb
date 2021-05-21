class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :deli_change
  belongs_to :pref
  belongs_to :deli_days

  with_options presence: true do
    validates :name
    validates :explain
    validates :category_id
    validates :status_id
    validates :deli_change_id
    validates :pref_id
    validates :deli_days_id
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid.' }
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :deli_change_id
    validates :pref_id
    validates :deli_days_id
  end
end
