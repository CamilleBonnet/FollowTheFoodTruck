class Api::V1::ChoicesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for Registration

  def update
    meal = Meal.find(params["meal_id"].to_i)

    basket = Basket.where(user: current_registration.user, status: "pending", truck: meal.truck).last || Basket.create(user: current_registration.user, status: "pending", truck: meal.truck)

    @choice = Choice.where(user: current_registration.user, basket: basket, meal: meal).last || Choice.new(meal: meal, user: current_registration.user, basket: basket, quantity: 0)

    if @choice.update(choice_params)
      @choice.update(price: (@choice.quantity * @choice.meal.price))
      basket.update(total_price: basket.choices.sum(&:price))
      flash[:notive] = "Choice updated"
    else
      flash[:alert] = "Choice could not be update"
      render_error
    end
  end

  private

  def choice_params
    params.require(:choice).permit(:quantity)
  end

  def render_error
    render json: { errors: @choice.errors.full_messages },
      status: :unprocessable_entity
  end
end
