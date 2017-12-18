class BasketsController < ApplicationController
  before_action :set_basket
  before_action :set_truck, only: [:show, :payment_status]
  def show
  end

  def update
    # redirect_to
  end

  def accepted_by_food_truck
    if @basket.update(status: "Accepted by FoodTruck")
      flash[:notice] = "The order was accepted"
    else
      flash[:notice] = "The order could not be accepted"
    end
    redirect_to order_owner_truck_path
  end

  def declined_by_food_truck
    if @basket.update(status: "Declined by FoodTruck")
      flash[:notice] = "The order was declined"
    else
      flash[:notice] = "The order could not be declined"
    end
    redirect_to order_owner_truck_path
  end

  def payment_status
    # here sripe
    @basket.update(status: "Payed by Customer")

  end

  def destroy
    if @basket.destroy
      flash[:notice] = "The order was deleted"
    else
      flash[:alert] = "The order was not deleted"
    end
    redirect_to myorders_path
  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

end
