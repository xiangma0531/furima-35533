require 'rails_helper'

RSpec.describe PurchaseRecordDeliveryAddress, type: :model do
  describe '購入履歴と配送先住所の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_delivery_address = FactoryBot.build(:purchase_record_delivery_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_record_delivery_address).to be_valid
      end

      it 'buildingが空でも保存できること' do
        @purchase_record_delivery_address.building = ''
        expect(@purchase_record_delivery_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では保存できないこと' do
        @purchase_record_delivery_address.postal_code = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角ハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_record_delivery_address.postal_code = '1234567'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-).')
      end

      it 'pref_idを選択していないと保存できないこと' do
        @purchase_record_delivery_address.pref_id = 1
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Pref must be other than 1')
      end

      it 'cityが空では保存できないこと' do
        @purchase_record_delivery_address.city = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("City can't be blank")
      end

      it 'phone_numが空では保存できないこと' do
        @purchase_record_delivery_address.phone_num = ''
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが全角数字では保存できないこと' do
        @purchase_record_delivery_address.phone_num = '０９０１２３４５６７８'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone num is invalid.')
      end

      it 'phone_numが半角英数字では保存できないこと' do
        @purchase_record_delivery_address.phone_num = '0901234567a'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone num is invalid.')
      end

      it 'phone_numが12桁以上では保存できないこと' do
        @purchase_record_delivery_address.phone_num = '090123456789'
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include('Phone num is invalid.')
      end

      it 'userが紐づいていないと保存できないこと' do
        @purchase_record_delivery_address.user_id = nil
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと保存できないこと' do
        @purchase_record_delivery_address.item_id = nil
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @purchase_record_delivery_address.token = nil
        @purchase_record_delivery_address.valid?
        expect(@purchase_record_delivery_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
