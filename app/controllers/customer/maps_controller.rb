class Customer::MapsController < ApplicationController
  
  def index
    @cafedate = current_customer.cafedates.build
    @cafedates = current_customer.cafedates.active_datas
    @go_schedule_cafedates = @cafedates.where(pin_type: :go_schedule_pins)
    @been_cafedates = @cafedates.where(pin_type: :been_pins)
    @cafedates_json = @cafedates.map{ |o| Hash[:id, o.id, :name, o.name, :lat, o.latitude.to_f, :lng, o.longitude.to_f, :pin_type, o.pin_type]}.to_json
  end
  
  # def create
  #   @cafedate = Cafedate.new(map_params)
  #   if @cafedate.save
  #     redirect_to maps_path
  #   else
  #     render maps_path
  #   end
  # end
  
  # private
  
  # def map_params
  #   params.require(:map).permit(:cafedate_id, :address)
  # end
end
