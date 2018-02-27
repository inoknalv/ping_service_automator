
class ServicesController < ApplicationController
  # Show all services' status
  def index
    @services = Service.all
  end
  # Add a service to the list
  def create
    Service.new
  end
  # Delete a service from the list
  def delete
  end
  # Update a service from the list
  def update
  end
  # Show the details of one service
  def show
  end

end
