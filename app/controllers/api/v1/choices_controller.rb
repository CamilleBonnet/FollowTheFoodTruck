class Api::V1::ChoicesController < Api::V1::BaseController
  acts_as_token_authentication_handler_for Registration

  def update
    meal = Meal.find(params["meal_id"].to_i)
    basket = Basket.where(user: current_registration.user.id, status: "pending", truck: meal.truck).last

    @choice = Choice.where(user_id: current_registration.user.id, basket: basket, meal_id: meal.id).last || Choice.new(meal_id: meal.id, user: current_registration.user.id, quantity: 0)
    if @choice.update(choice_params)
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
