# class SnsCredential < ApplicationRecord
#   belongs_to :user, optional: true
#   validates :uid,presence: true
#   validates :provider,presence: true
#   validates :user_id,presence: true
# end

# FactoryBot.define do
#   factory :sns_credential do
#     provider { "google_oauth2" }
#     uid { "111883521818716884871" }
#     user_id { 3 }
#   end
# end