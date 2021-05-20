require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '入力内容に問題がなければ、商品情報が保存される' do
      it '必要な情報がすべて条件を満たした上で入力されているとき' do
        expect(@item).to be_valid
      end
    end

    context '入力内容に問題があれば、商品情報は保存されない' do
      it 'imageがないと保存されない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'nameが空だと保存されない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'explainが空だと保存されない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it 'category_idが未選択だと保存されない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it 'status_idが未選択だと保存されない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end

      it 'deli_change_idが未選択だと保存されない' do
        @item.deli_change_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deli change must be other than 1')
      end

      it 'pref_idが未選択だと保存されない' do
        @item.pref_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Pref must be other than 1')
      end

      it 'deli_days_idが未選択だと保存されない' do
        @item.deli_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Deli days must be other than 1')
      end

      it 'priceが空だと保存されない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが全角数字だと保存されない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid.')
      end

      it 'priceが半角英数字で入力されていると保存されない' do
        @item.price = '1000a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid.')
      end

      it 'priceが半角英字で入力されていると保存されない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid.')
      end

      it 'priceが300未満だと保存されない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid.')
      end

      it 'priceが9,999,999を超えると保存されない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid.')
      end

      it 'userが紐づいていないと保存されない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
