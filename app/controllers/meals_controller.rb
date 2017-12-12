class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]
  before_action :set_truck, only: [:create, :edit, :update]

  def new
    @meal = Meal.new
  end

  def create
    @meal = meal.new(meal_params)
    @meal.truck_id = @truck
    @meal.save
  end

  def edit
  end

  def update
    @meal.update(meal_params)
  end

  def destroy
    @meal.destroy
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def meal_params
    params.require(:meal).permit(:description, :is_vegan, :is_fat_free, :is_alergen, :is_gluten_free, :spicy_scale, :price, :truck_id)
  end

end
