class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]
  before_action :set_truck, only: [:create, :edit, :update]

  def create
    @meal = Meal.new(meal_params)
    @meal.truck = @truck

    @meal.save
    redirect_to owner_truck_path(@meal)
  end

  def edit
  end

  def update
    @meal.update(meal_params)
    redirect_to owner_truck_path(@meal)
  end

  def destroy
    @meal.destroy
    redirect_to owner_truck_path(@meal)
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def meal_params
    params.require(:meal).permit(:description, :is_vegan, :is_fat_free, :is_alergen, :is_gluten_free, :spicy_scale, :price, :truck_id, :photo)
  end

end
