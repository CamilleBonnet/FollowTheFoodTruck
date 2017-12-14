class MealsController < ApplicationController
  before_action :set_meal, only: [:edit, :update, :destroy]
  before_action :set_truck, only: [:create, :edit, :update]

  def create
    @meal = Meal.new(meal_params)
    @meal.truck = @truck
    if @meal.save
      flash[:notice] = "Meal #{@meal.description} has been created"
      redirect_to owner_truck_path(@meal)
    else
      flash[:alert] = "Meal could not be created"
      redirect_to owner_truck_path
    end
  end

  def edit
  end

  def update
    @meal.update(meal_params)
    if @meal.update
      flash[:notice] = "Meal #{@meal.description} has been updated"
      redirect_to owner_truck_path
    else
      flash[:alert] = "Meal could not be updated"
      redirect_to owner_truck_path
    end
  end

  def destroy
    if @meal.destroy
      flash[:notice] = "Meal has been destroyed"
      redirect_to owner_truck_path
    else
      flash[:alert] = "Meal could not be destroyed"
      redirect_to owner_truck_path
    end
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
