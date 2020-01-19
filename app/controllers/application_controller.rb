class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def  configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :birthday_year, :birthday_month, :birthday_day, :phone_number, :kanji_family, :kanji_name, :katakana_family, :katakana_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:text, :post_number, :prefecture, :municipality, :house_number, :building_name])
  end
end