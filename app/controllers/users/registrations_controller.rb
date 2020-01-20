# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  require 'payjp'

  def index
  end
  
  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    session[:name] = user_params[:name]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:kanji_name] = user_params[:kanji_name]
    session[:kanji_family] = user_params[:kanji_family]
    session[:katakana_name] = user_params[:katakana_name]
    session[:katakana_family] = user_params[:katakana_family]
    session[:birthday_year] = user_params[:birthday_year]
    session[:birthday_month] = user_params[:birthday_month]
    session[:birthday_day] = user_params[:birthday_day]
    @user = User.new(
      name: session[:name],
      email: session[:email],
      password: session[:password],
      kanji_name: session[:kanji_name],
      kanji_family: session[:kanji_family],
      katakana_name: session[:katakana_name],
      katakana_family: session[:katakana_family],
      birthday_year: session[:birthday_year],
      birthday_month: session[:birthday_month],
      birthday_day: session[:birthday_day],
      phone_number: "08000000000",
      post_number1: "000-0000",
      prefecture1: "1",
      municipality1: "福岡市",
      house_number1: "博多区",
      building_name1: "",
      address_phone: ""
    )
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    @user = User.new
    render :new_phone
  end

  def create_phone
    session[:phone_number] = user_params[:phone_number]
    @user = User.new(
        name: session[:name],
        email: session[:email],
        password: session[:password],
        kanji_name: session[:kanji_name],
        kanji_family: session[:kanji_family],
        katakana_name: session[:katakana_name],
        katakana_family: session[:katakana_family],
        birthday_year: session[:birthday_year],
        birthday_month: session[:birthday_month],
        birthday_day: session[:birthday_day],
        phone_number: session[:phone_number],
        post_number1: "000-0000",
        prefecture1: "1",
        municipality1: "福岡市",
        house_number1: "博多区",
        building_name1: "",
        address_phone: ""
      )
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    @user = User.new
    render :new_address
  end

  def create_address
    session[:post_number1] = user_params[:post_number1]
    session[:prefecture1] = user_params[:prefecture1]
    session[:municipality1] = user_params[:municipality1]
    session[:house_number1] = user_params[:house_number1]
    session[:building_name1] = user_params[:building_name1]
    session[:address_phone] = user_params[:address_phone]
    @user = User.new(
        name: session[:name],
        email: session[:email],
        password: session[:password],
        kanji_name: session[:kanji_name],
        kanji_family: session[:kanji_family],
        katakana_name: session[:katakana_name],
        katakana_family: session[:katakana_family],
        birthday_year: session[:birthday_year],
        birthday_month: session[:birthday_month],
        birthday_day: session[:birthday_day],
        phone_number: session[:phone_number],
        post_number1: session[:post_number1],
        prefecture1: session[:prefecture1],
        municipality1: session[:municipality1],
        house_number1: session[:house_number1],
        building_name1: session[:building_name1],
        address_phone: session[:address_phone]
      )
    if @user.save
      session[:id] = @user.id
      render :new_card
    else
      flash.now[:alert] = @user.errors.full_messages
      render :new_address
    end
  end

  def create_card
    Payjp.api_key = "sk_test_a953276c4707a1d8f7700184"
    if params['payjpToken'].blank?
      render :new_card
    else
      customer = Payjp::Customer.create(
      card: params['payjpToken']
      )
      @card = Card.new(user_id: session[:id], customer_id: customer.id, card_id: customer.default_card)
      if @card.save
      else
        render :new_card
      end
    end
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password, 
      :password_confirmation, 
      :birthday_year,
      :birthday_month,
      :birthday_day,
      :kanji_family,
      :kanji_name,
      :katakana_family,
      :katakana_name,
      :phone_number,
      :post_number1,
      :prefecture1,
      :municipality1,
      :house_number1,
      :building_name1,
      :address_phone
    )
  end
end
