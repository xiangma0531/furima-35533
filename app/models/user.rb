class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Input full-width characters.' }

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birthday
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]/, message: 'is invalid. Input full-width characters.' } do
    validates :first_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters.' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  has_many :items
end
