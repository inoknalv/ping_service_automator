

class PingService

  def ping(service_id)
    service = Service.find(service_id)
    @http = Net::Ping::HTTP.new(service.host + (service.port.nil? ? "" : ":" + service.port))
    rtary = []
    pingfails = 0
    repeat = 5 # Float::INFINITY
    puts 'starting to ping'
    (1..repeat).each do

      if @http.ping
        rtary << @http.duration
        puts "#{@http.code}: host replied in #{@http.duration}"
      else
        pingfails += 1
        puts "timeout"
      end
      service_status(@http.code, @http.duration, service.current_status)
      sleep(2)
    end
    avg = rtary.inject(0) {|sum, i| sum + i}/(repeat - pingfails)
    puts "Average round-trip is #{avg}\n"
    puts "#{pingfails} packets were dropped"
    if !@http.exception.nil?
      puts @http.exception
    end
  end

  # Define the status with the response code
  def service_status(code, response_time = nil, status)
    case
    when code == "200" && response_time <= 0.4
      status = "GREEN"
      puts "#{status}"
    when code == "200" && response_time > 0.4
      status = "ORANGE"
      puts "#{status}"
    when code != "200"
      status = "RED"
      puts "#{status}"
    else
      status = "CHECK SERVICE URL"
      puts "#{status}"
    end
  end


end
