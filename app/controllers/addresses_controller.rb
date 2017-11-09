class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def created
    @address = Address.new(address_params)
    if @address.save
      flash[:success] = "Address added!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  private
  
  def address_params
    params.require(:address).permit(:street, :suburb, :state, :postcode, :country, :latitude, :longitude)
  end
  
end