class CalendarsController < ApplicationController
  before_action :set_calendar, only: [:edit, :update, :destroy]
  before_action :set_address, only: [:create, :update]

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.address = @address
    if @calendar.save
      flash[:notice] = "Calendar has been saved"
      redirect_to owner_truck_path(@calendar)
    else
      flash[:alert] = "Calendar could not be saved"
      redirect_to owner_truck_path
    end
  end

  def edit
  end

  def update
    if @calendar.update(calendar_params)
      flash[:notice] = "Calendar has been updated"
      redirect_to owner_truck_path
    else
      flash[:alert] = "Calendar could not be updated"
      redirect_to owner_truck_path
    end
  end

  def destroy
    if @calendar.destroy
      flash[:notice] = "Calendar has been destroyed"
      redirect_to owner_truck_path
    else
      flash[:alert] = "Calendar could not be destroyed"
      redirect_to owner_truck_path
    end
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
