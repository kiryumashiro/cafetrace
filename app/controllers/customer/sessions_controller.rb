# frozen_string_literal: true

class Customer::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    flash[:notice] = 'ログインに成功しました'
    maps_path
  end 
  
  # def new_guest
  #   customer = Customer.guest
  #   sign_in customer   # ユーザーをログインさせる
  #   redirect_to maps_path, notice: 'ゲストユーザーとしてログインしました。'
  # end

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to maps_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
    before_action :withdraw, only: [:create]

    protected

   def withdraw
        @customer = Customer.find_by(email: params[:customer][:email])
      if @customer&.valid_password?(params[:customer][:password]) && @customer.is_deleted
          redirect_to new_customer_session_path, notice: 'アカウントは退会済みです。'
      end
   end
end
