class Api::V1::StatusController < Api::V1::BaseController
  acts_as_token_authentication_handler_for Registration

  def update
    basket = Basket.find(params[:basket_id])
    # binding.pry
    unless basket.update(basket_params)
      flash[:alert] = "The order could not be updated"
      render_error
    end
  end

  private

  def basket_params
    params.permit(:status)
  end

  def render_error
    render json: { errors: @basket.errors.full_messages },
      status: :unprocessable_entity
  end
end
