require 'net/ping'
require 'socket'

class RequestsController < ApplicationController

  # Ping a service and insert the request
  def start()
    begin
      if !params[:id].nil?
        @request = Request.new
        PingWorker.perform_async(params[:id])
        # render text: "Sent ping to #{service}"
      end
    end
  end

  # Update the service with the response from ping
  def response_from_service

  end
end
