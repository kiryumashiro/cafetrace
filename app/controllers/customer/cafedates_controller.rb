class Customer::CafedatesController < ApplicationController
  
  def index
    case params[:pin_type]
    when 'go_schedule'
      @cafedates = Cafedate.go_schedule_pins
    when 'been'
      @cafedates = Cafedate.been_pins
    end
  end
  
  def create
    @cafedate = current_customer.cafedates.build(cafedate_params)
    if @cafedate.save!
      flash[:success] = "投稿が成功しました"
      redirect_to maps_path
    else
      flash[:success] = "失敗"
      render template: 'customer/maps/index'
    end
  end
  
  private
  
  def cafedate_params
    params.require(:cafedate).permit(:pin_type, :name, :desctiption, :image, :address, :latitude, :longitude)
  end
end
