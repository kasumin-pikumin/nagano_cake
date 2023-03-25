class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def unsubscribe
  end



private

  def list_params
    params.require(:customer).permit(:last_name, :first_name, :postal_code, :address, :telephone_number)
  end

end