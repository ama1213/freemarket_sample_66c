class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
         VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
         VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/i

         validates :name,               presence: true, length: { maximum: 20 }
         validates :email,              presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
         validates :password,           presence: true, length: { minimum: 7 }, format: { with: VALID_PASSWORD_REGEX }
         validates :birthday_year,      presence: true
         validates :birthday_month,     presence: true
         validates :birthday_day,       presence: true
         validates :phone_number,       presence: true, format: { with: VALID_PHONE_REGEX }
         validates :kanji_family,       presence: true
         validates :kanji_name,         presence: true
         validates :katakana_family,    presence: true, format: { with: VALID_KATAKANA_REGEX }
         validates :katakana_name,      presence: true, format: { with: VALID_KATAKANA_REGEX }
         validates :post_number1,       presence: true, length: { maximum: 8 }, format: { with: VALID_POSTAL_CODE }
         validates :prefecture1,        presence: true
         validates :municipality1,      presence: true
         validates :house_number1,      presence: true

  has_one :card
  accepts_nested_attributes_for :card

  FactoryBot.define do

    factory :user do
      name                  {"taka"}
      email                 {"yyh7uk@gmail.com"}
      password              {"takayy7899"}
      birthday_year         {"7"}
      birthday_month        {"7"}
      birthday_day          {"7"}
      phone_number          {"08011110000"}
      kanji_family          {"山田"}
      kanji_name            {"太郎"}
      katakana_family       {"ヤマダ"}
      katakana_name         {"タロウ"}
      post_number1          {"090-0000"}
      prefecture1           {"7"}
      municipality1         {"福岡市"}
      house_number1         {"博多区"}
    end
  end
end
