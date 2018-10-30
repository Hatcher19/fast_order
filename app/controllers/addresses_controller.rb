class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
    @addresses = Address.all
  end

  def show
  end

  def new 
    @address = current_user.addresses.build
  end
  
  def edit
  end

  def create
    @address = current_user.addresses.build(address_params)

    if @address.save
      redirect_to edit_user_registration_path(current_user), notice: 'Address successfully created'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:street, :unit, :city, :state, :zipcode, :user_id, :address_name, :contact_name)
    end
end
