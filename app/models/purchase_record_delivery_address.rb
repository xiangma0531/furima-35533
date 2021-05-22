class PurchaseRecordDeliveryAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :pref_id, :city, :address, :building, :phone_num, :purchase_record_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-).'}
    validates :city
    validates :address
    validates :phone_num, format: {with: /\A[0-9]{11}\z/, message: 'is invalid.'}
    validates :token
  end
  validates :pref_id, numericality: {other_than: 1}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(postal_code: postal_code, pref_id: pref_id, city: city, address: address, building: building, phone_num: phone_num, purchase_record_id: purchase_record.id)
  end
end