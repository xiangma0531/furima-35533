class PurchaseRecordDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :pref_id, :city, :address, :building, :phone_num, :purchase_record_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-).'}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{11}\z/, message: 'is invalid.'}
    validates :purchase_record_id
  end
  validates :pref_id, numericality: {other_than: 1}
end