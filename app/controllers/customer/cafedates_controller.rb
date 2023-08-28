class Customer::CafedatesController < ApplicationController
  
  def show
    @cafedate = Cafedate.find(params[:id])
  end
  
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
  
  def edit
    @cafedate = Cafedate.find(params[:id])
  end
  
  def update
    @cafedate = Cafedate.find(params[:id])
    if @cafedate.update(cafedate_params)
      redirect_to @cafedate, notice: 'データが更新されました。'
    else
      render :edit
    end
  end
  
  def destroy
    @cafedate = Cafedate.find(params[:id])
    @cafedate.destroy
    redirect_to maps_path, notice: 'データが削除されました。'
  end
  

  
  private
  
  def cafedate_params
    params.require(:cafedate).permit(:pin_type, :name, :desctiption, :image, :address, :latitude, :longitude)
  end
end
