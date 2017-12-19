class Api::V1::RestaurantsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User
  before_action :set_choice, only: [ :update ]

  def update
    @choice = Choice.where(user_id: current_user.id, basket: @basket, meal_id: meal.id).last || Choice.new(meal_id: meal.id, user: current_user, quantity: 0)
    if @choice.update(choice_params)

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
