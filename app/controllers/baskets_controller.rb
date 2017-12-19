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
    @basket.update(status: "Payed by Customer")
  end

  def payment_with_stripe
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
      )

    charge = Stripe::Charge.create(
      customer:     current_user.id,   # You should store this customer id and re-use it.
      amount:       @basket.total_price_cents,
      description:  "Payment for food at #{@basket.truck.name} for order #{@basket.id}",
      currency:     @basket.total_price.currency
      )

    @basket.update(payment: charge.to_json, status: 'Payed by Customer')
    redirect_to payment_status_truck_path(@basket.truck)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to payorder_truck_path(@basket.truck)
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
    @basket = Basket.where(truck_id: params[:id], user: current_user, status: "pending").last
  end

  def set_truck
    @truck = Truck.find(params[:id])
  end

end
