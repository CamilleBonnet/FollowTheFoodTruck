class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]
  before_action :set_truck, only: [:create, :edit, :update]

  def create
    @address = Address.new(address_params)
    @address.truck = @truck
    if @address.save
      flash[:notice] = "Address #{@address.street_address} has been saved"
      redirect_to owner_truck_path
    else
      flash[:alert] = "Address could not be saved"
      redirect_to owner_truck_path
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      flash[:notice] = "Address #{@address.street_address} has been updated"
      redirect_to owner_truck_path
    else
      flash[:alert] = "Address could not be updated"
      redirect_to owner_truck_path
    end
  end

  def destroy
    if @address.destroy
      flash[:notice] = "Address has been destroyed"
      redirect_to owner_truck_path
    else
      flash[:alert] = "Address could not be destroyed"
      redirect_to owner_truck_path
    end
  end

  def set_active_address
    flash[:notice] = "Address has been set as active"
    redirect_to owner_truck_path
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
