class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:edit, :update, :destroy]
  before_action :set_address, only: [:create, :edit, :update, :destroy]

  def show
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar= Calendar.new(calendar_params)
    @calendar.address = @address
    @calendar.save
  end

  def edit
  end

  def update
    @calendar.update(calendar_params)
  end

  def destroy
    @calendar.destroy
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(:starting_date, :ending_date, :address_id)
  end

end
