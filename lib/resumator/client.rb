require 'faraday'
require 'json'
require 'hashie'

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
        resp = @connection.get "jobs/#{options[:id]}"
      elsif options.size > 0
        resp = @connection.get "jobs#{Client.parse_options(options)}"
      else
        resp = @connection.get "jobs"
      end
      raise "Bad response: #{resp.status}" unless resp.status == 200
      Client.mash(JSON.parse(resp.body))
    end

    def self.mash(response)
      if response.is_a? Array
        return response.map{|o| Hashie::Mash.new(o)}
      else
        return Hashie::Mash.new(response)
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
