require 'faraday'
module Resumator
  class Client
    def initialize(key)
      raise "Missing API key" unless key and not key.empty?
      @api_key = key
      @connection = Faraday.new(url: "https://api.resumatorapi.com/v1/") do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :logger if ENV['DEBUG']
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end
      @connection.params['apikey'] = @api_key
    end

    def jobs
      @connection.get 'jobs'
    end
  end
end
