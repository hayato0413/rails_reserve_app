class ReserveController < ApplicationController
  
  before_action :access_control, { only: [:new, :create, :show]}

  def home
  end
  
  def room
    @room = RentHouse.find_by(id: params[:id])
    @reserved = ReservedRoom.new
  end

  def new
    @room = RentHouse.new
  end


  def create
    @room_img = params[:img]
    @room = RentHouse.new(room_params)
    @room.img = "#{@room.roomname}.jpg"
    if @room.save
      File.binwrite("public/house_img/#{@room.roomname}", @room_img.read)
      redirect_to("/reserve/search")
    else
      render("reserve/new") 
    end
  end

  def search
    area = params[:search_area]
    key = params[:search_key]
    if area.present?
      @houses = RentHouse.where("adress LIKE ?", "%#{area}%")
    elsif key.present?
      @houses = RentHouse.where("roomname LIKE ? OR roomtext LIKE ? OR adress LIKE ?", "%#{key}%", "%#{key}%", "%#{key}%")
    else
      @houses = RentHouse.all
    end
    
    if @houses.size == false
      @houses = {}
    end
  end

  def show
    @houses = RentHouse.where(user_id: session[:user_id])
  end

  
  private
    def room_params
      @current_user = User.find_by(id: session[:user_id])
      params.permit(:roomname, :roomtext, :price, :adress, :img).merge(user_id: @current_user.id)
    end

end
