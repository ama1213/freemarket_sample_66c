# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :name,               null: false
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.integer :birthday_year,     null: false
      t.integer :birthday_month,    null: false
      t.integer :birthday_day,      null: false
      t.string :phone_number,       null: false, unique: true
      t.string :kanji_family,       null: false
      t.string :kanji_name,         null: false
      t.string :katakana_family,    null: false
      t.string :katakana_name,      null: false
      t.string :post_number1,       null: false
      t.string :prefecture_id,      null: false
      t.string :municipality1,      null: false
      t.string :house_number1,      null: false
      t.string :building_name1
      t.string :address_phone
      t.text :text
      t.string :post_number2
      t.string :prefecture2
      t.string :municipality2
      t.string :house_number2
      t.string :building_name2


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
