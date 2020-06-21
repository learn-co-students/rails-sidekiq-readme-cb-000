class CustomersController < ApplicationController
  require 'csv'

  def index
    @customers = Customer.all
    @customer_count = @customers.length
  end

  def upload
    LeadsWorker.perform_async(params[:leads].path)
    redirect_to customers_path
  end

end
