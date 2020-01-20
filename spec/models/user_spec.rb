require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a name, email, password, birthday_year, birthday_month, birthday_day, phone_numberber, kanji_family, kanji_name, katakana_family, katakana_name, post_number1, prefecture_id, municipality1, house_number1" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a name" do
      user = build(:user, name: "")
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "is invalid without a birthday_year" do
      user = build(:user, birthday_year: "")
      user.valid?
      expect(user.errors[:birthday_year]).to include("を入力してください")
    end

    it "is invalid without a birthday_month" do
      user = build(:user, birthday_month: "")
      user.valid?
      expect(user.errors[:birthday_month]).to include("を入力してください")
    end

    it "is invalid without a birthday_day" do
      user = build(:user, birthday_day: "")
      user.valid?
      expect(user.errors[:birthday_day]).to include("を入力してください")
    end

    it "is invalid without a phone_number" do
      user = build(:user, phone_number: "")
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

    it "is invalid without a kanji_family" do
      user = build(:user, kanji_family: "")
      user.valid?
      expect(user.errors[:kanji_family]).to include("を入力してください")
    end

    it "is invalid without a kanji_name" do
      user = build(:user, kanji_name: "")
      user.valid?
      expect(user.errors[:kanji_name]).to include("を入力してください")
    end

    it "is invalid without a katakana_family" do
      user = build(:user, katakana_family: "")
      user.valid?
      expect(user.errors[:katakana_family]).to include("を入力してください")
    end

    it "is invalid without a katakana_name" do
      user = build(:user, katakana_name: "")
      user.valid?
      expect(user.errors[:katakana_name]).to include("を入力してください")
    end

    it "is invalid without a post_number1" do
      user = build(:user, post_number1: "")
      user.valid?
      expect(user.errors[:post_number1]).to include("を入力してください")
    end

    it "is invalid without a prefecture_id" do
      user = build(:user, prefecture_id: "")
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end
    
    it "is invalid without a municipality1" do
    user = build(:user, municipality1: "")
    user.valid?
    expect(user.errors[:municipality1]).to include("を入力してください")
    end

    it "is invalid without a house_number1" do
      user = build(:user, house_number1: "")
      user.valid?
      expect(user.errors[:house_number1]).to include("を入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is valid with a name that has less than 20 characters " do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end

    it "is invalid with a name that has more than 20 characters" do
      user = build(:user, name: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:name]).to include(("は20文字以内で入力してください"))
    end

    it 'is invalid with a email wrong format' do
      user = build(:user, email: 'a1234567')
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "a2345", password_confirmation: "a2345")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end

    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "a234567", password_confirmation: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a password that Contains letters and numbers " do
      user = build(:user, password: "a234567", password_confirmation: "a234567")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a password except for numbers" do
      user = build(:user, password: "1111111111", password_confirmation: "1111111111")
      user.valid?
      expect(user.errors[:password][0]).to include("")
    end

    it "is invalid with a password except for alphabets" do
      user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
      user.valid?
      expect(user.errors[:password][0]).to include("")
    end

    it "is valid with a katakana_name that katakana " do
      user = build(:user, katakana_name: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a katakana_name that katakana " do
      user = build(:user, katakana_name: "あ")
      user.valid?
      expect(user.errors[:katakana_name][0]).to include("は不正な値です")
    end

    it "is valid with a katakana_family that katakana " do
      user = build(:user, katakana_family: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a katakana_family that katakana " do
      user = build(:user, katakana_family: "あ")
      user.valid?
      expect(user.errors[:katakana_family][0]).to include("は不正な値です")
    end

    it "is valid with a phone_number that Phone number format " do
      user = build(:user, phone_number: "08012345678")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a phone_number that Phone number format " do
      user = build(:user, phone_number: "a8012345678")
      user.valid?
      expect(user.errors[:phone_number][0]).to include("は不正な値です")
    end

    it "is valid with a post_number1 that Postal code format " do
      user = build(:user, post_number1: "000-0000")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a post_number1 that Postal code format " do
      user = build(:user, post_number1: "a00-0000")
      user.valid?
      expect(user.errors[:post_number1]).to include("は不正な値です")
    end

    it "is valid with a prefecture_id that has less than 48" do
      user = build(:user, prefecture_id: "48")
      expect(user).to be_valid
    end

    it "is invalid with a prefecture_id that has more than 49" do
      user = build(:user, prefecture_id: "49")
      user.valid?
      expect(user.errors[:city])
    end

    it "is invalid with a prefecture_id only integer" do
      user = build(:user, prefecture_id: "a")
      user.valid?
      expect(user.errors[:city])
    end
  end
end