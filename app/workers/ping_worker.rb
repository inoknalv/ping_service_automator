class PingWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(webservice_id)
    ping = PingService.new
    ping.ping(webservice_id)
  end
end
