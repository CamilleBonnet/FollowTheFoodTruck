class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]
  before_action :set_truck, only: [:create, :edit, :update, :destroy]

  def new
    @address = Address.new
  end

  def create
    @address = address.new(address_params)
    @address.truck = @truck
    @address.save
  end

  def edit
  end

  def update
    @address.update(address_params)
  end

  def destroy
    @address.destroy
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def set_truck
    @truck = Truck.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street_address, :street_address_2, :city, :zipcode, :country, :more_info, :truck_id)
  end

end
