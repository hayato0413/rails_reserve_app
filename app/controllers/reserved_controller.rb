class ReservedController < ApplicationController

  def new
    @room = RentHouse.find_by(id: params[:id])
    @reserved = ReservedRoom.new
      
    if params[:startday].present? && params[:endday].present? && params[:number_of_person].present?
      start = params[:startday].split("-")
      ed = params[:endday].split("-")
      startday = Date.new(start[0].to_i, start[1].to_i, start[2].to_i)
      endday = Date.new(ed[0].to_i, ed[1].to_i, ed[2].to_i)
      @sum_day = (endday - startday).to_i

      @sum_price = @room.price.to_i * params[:number_of_person].to_i * @sum_day
    else
      render template: "reserve/room"
    end
  end

  def create
      @reserved = ReservedRoom.new(reserved_params)
    
      if @reserved.save
        redirect_to("/reserved/show")
      else 
        render template: "reserve/room"
      end
  end

  def show
    @reserves = ReservedRoom.all 
  end


  private
    def reserved_params
      @room = RentHouse.find_by(id: params[:id])
      params.permit(:startday, :endday, :sum_price, :number_of_person).merge(roomname: @room.roomname, roomtext: @room.roomtext, img: @room.img, room_id: params[:id])
    end
end