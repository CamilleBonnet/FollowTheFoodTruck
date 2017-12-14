class AddressesController < ApplicationController
  before_action :set_address, only: [:update, :destroy]
  before_action :set_truck, only: [:create, :update]

  def create
    @address = Address.new(address_params)
    @address.truck = @truck
    @address.save
    redirect_to owner_truck_path(@address)
  end

  def edit
  end

  def update
    @address.update(address_params)
    redirect_to owner_truck_path(@address)
  end

  def destroy
    @address.destroy
    redirect_to owner_truck_path(@address)
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def set_truck
    @truck = Truck.find(params[:truck_id])
  end

  def address_params
    params.require(:address).permit(:street_address, :street_address_2, :city, :zipcode, :country, :more_info, :truck_id)
  end

end
