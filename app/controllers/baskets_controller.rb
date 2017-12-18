class BasketsController < ApplicationController
  before_action :set_basket
  before_action :set_truck, only: [:show, :payment_status]
  def show
  end

  def update
    # redirect_to
  end

  def payment_status
    @basket.update(status: "confirmed")
  end





  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

end
