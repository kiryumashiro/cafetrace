class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
  end

  def edit
  end

  def update
  end

  def withdraw
  end

  def withdraw_update
  end

  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :email, :phone_number)
  end
end
