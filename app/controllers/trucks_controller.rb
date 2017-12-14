class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]
  before_action :set_all_trucks, only: [:home, :index]


  def home
  end

  def index
  end

  def new
    @truck = Truck.new
  end

  def show
    # @basket = Basket.new
    # @tol = TruckOrderList.new(truck: @truck)
    @basket = Basket.where(user: current_user, status: "pending").last || Basket.create(user: current_user, status: "pending")
    # @choice = Choice.new(truck: @truck, basket: @basket, user: current_user)
    @tables = []
    @truck.meals.each_with_index do |meal, index|
      @tables[index] = {meal: meal,
                        choice: Choice.where(user_id: current_user.id, meal_id: meal.id, basket_id: @basket.id).last || Choice.new(meal_id: meal.id, truck: @truck, basket: @basket, user: current_user, quantity: 0)}
    end
  end

  def show_owner
    # to add a new object
    @truck = Truck.find_by(user: current_user)
    @meal = Meal.new
    @address = Address.new
    @calendar = Calendar.new

    # to display all the object already existing
    @meals = Meal.all
    @addresses = Address.all
    @calendars = Calendar.all
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
    @truck.update(truck_params)
    redirect_to owner_truck_path
  end

  def destroy
    @truck.destroy
    redirect_to trucks_path
  end


  private

  def set_all_trucks
    @trucks = Truck.all
  end

  def set_truck
    @truck = Truck.find(params[:id])
  end

  def truck_params
    params.require(:truck).permit(:name, :type_of_food, :pay_online, :payment_info, photos: [])
  end
end
