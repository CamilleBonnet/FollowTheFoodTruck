class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:edit, :update, :destroy]
  before_action :set_address, only: [:create, :update]

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.address = @address
    @calendar.save
    redirect_to owner_truck_path(@calendar)
  end

  def edit
  end

  def update
    @calendar.update(calendar_params)
    redirect_to owner_truck_path
  end

  def destroy
    @calendar.destroy
    redirect_to owner_truck_path
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def set_address
    @address = Address.find(params[:calendar][:address_id])
  end

  def calendar_params
    params.require(:calendar).permit(:starting_date, :ending_date, :address_id)
  end

end
