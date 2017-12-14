class BasketsController < ApplicationController
  before_action :set_basket

  def show
    @truck = Truck.find(params[:truck_id])
  end

  def update
    # redirect_to
  end

  def payment_sucess

  end

  private

  def set_basket
    @basket = Basket.find(params[:id])
  end

end
