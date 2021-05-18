require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録に成功するとき' do
      it '問題がなければ新規登録ができる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録に失敗するとき' do
      it 'emailが空では新規登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '既に存在するemailは使用できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it '@がないemailは使用できない' do
        @user.email = 'testtest.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        test_pass = '123ab'
        @user.password = test_pass
        @user.password_confirmation = test_pass
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '123abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字のみでは登録できない' do
        test_pass = 'aaaaaa'
        @user.password = test_pass
        @user.password_confirmation = test_pass
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input full-width characters.')
      end

      it 'passwordが半角数字のみでは登録できない' do
        test_pass = '000000'
        @user.password = test_pass
        @user.password_confirmation = test_pass
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input full-width characters.')
      end

      it 'passwordが全角英数字では登録できない' do
        test_pass = 'ａａａ１１１'
        @user.password = test_pass
        @user.password_confirmation = test_pass
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
      end

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが漢字・平仮名・カタカナ以外では登録できない' do
        binding.pry
        @user.first_name = 'aa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが漢字・平仮名・カタカナ以外では登録できない' do
        @user.last_name = 'aa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
