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

    def jobs(options = {})
      if options[:id]
        @connection.get "jobs/#{options[:id]}"
      elsif options.size > 0
        @connection.get "jobs#{Client.parse_options(options)}"
      else
        @connection.get "jobs"
      end
    end

    def self.parse_options(options = {})
      out = ""
      for k, v in options do
        out << "/#{k}/#{v}"
      end
      out
    end
  end
end
