# class Customer::GuestSessionsController < ApplicationController
#   def create
#     customer = Customer.find_or_create_by!(email: 'guest_member@example.com',encrypted_password: 'password')
#     if customer
#       sign_in(customer)
#       redirect_to maps_path, notice: 'ゲスト会員としてログインしました。'
#     else
#       redirect_to root_path, alert: 'ゲスト会員が見つかりませんでした。'
#     end
#   end
  
#   private
#   def customer_params
#     params.require(:customer).permit(:email)
#   end
# end
