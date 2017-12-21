class TrucksController < ApplicationController
  skip_before_action :authenticate_registration!, only: [:home, :index, :show]
  before_action :set_truck, only: [:show, :edit, :update, :destroy, :address]
  before_action :set_all_trucks, only: [:home]


  def home
  end

  def index
    if params["city_user"].nil? || params["city_user"] == ""
      @addresses = Address.where.not(latitude: nil, longitude: nil)
      set_all_trucks
    else
      city = params.permit(:city_user)
      all_addresses = Address.near(city["city_user"], 10)
      @trucks = []
      @addresses = []
      all_addresses.each do |address|
        @trucks << address.truck unless address.active_address.nil?
        @addresses << address unless address.active_address.nil?
      end
    end

    @markers = Gmaps4rails.build_markers(@addresses) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
      marker.infowindow render_to_string(partial: "/shared/map_box", locals: { address: address })
    end
  end

  def new
    if current_user.trucks.empty?
      @truck = Truck.new
    else
      redirect_to root_path
      flash[:notice] = "You already have a truck."
    end
  end

  def show
    # @basket = Basket.new
    # @tol = TruckOrderList.where(date: Date.today) || TruckOrderList.create(truck: @truck, date: Date.today)
    # @choice = Choice.new(truck: @truck, basket: @basket, user: current_user)
    if user_signed_in?
      @basket = Basket.where(user: current_user, truck: @truck, status: "pending").last
      @tables = []
      @truck.meals.each_with_index do |meal, index|
        @tables[index] = {
          meal: meal,
          choice: Choice.where(
            user_id: current_user.id,
            basket: @basket,
            meal_id: meal.id).last || Choice.new(meal_id: meal.id, user: current_user, quantity: 0)
        }
      end
    end
    address = @truck.address || @truck.addresses.last
    @marker = Gmaps4rails.build_markers(address) do |address, marker|
      marker.lat address.latitude
      marker.lng address.longitude
    end
  end

  def create
    user = current_user
    @truck = Truck.new(truck_params)
    @truck.user = user
    if @truck.save
      redirect_to owner_truck_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @truck.update(truck_params)
      flash[:notice] = "The truck was successfully edited"
    else
      flash[:alert] = "The truck could not be updated"
    end
    redirect_to owner_truck_path
  end

  def destroy
    if @truck.destroy
      flash[:notice] = "The truck was deleted"
    else
      flash[:alert] = "The truck could not be deleted"
    end
    redirect_to trucks_path
  end

  def show_owner
    # to add a new object
    @truck = Truck.find_by(user: current_user)
    @meal = Meal.new
    @address = Address.new
    @calendar = Calendar.new(truck: @truck)

    @calendars = @truck.calendars
    # @calendars = []
    # @truck.addresses.each do |address|
      # address.calendars.each do |calendar|
        # @calendars << calendar
      # end
    # end
  end

  def truck_order
    @truck = Truck.find_by(user: current_user)
    @baskets = Basket.where(status: ["pending", "confirmed", "Payed by Customer", "Accepted by FoodTruck", "Declined by FoodTruck"], truck: @truck).order(:status)
  end

  private

  def set_all_trucks
    @trucks = Truck.all
  end

  def set_truck
    @truck = Truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:name, :type_of_food, :pay_online, :description, :payment_info, photos: [])
  end
end
