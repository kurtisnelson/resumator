require 'faraday'
require 'json'
require 'hashie'

module Resumator
  class Client
    # Sets up a client
    #
    # @param [String] API key
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

    # Get any rest accessible object
    #
    # @param [String] object name
    # @param [Hash] optional search parameters
    # @return [Mash] your data
    def get(object, options = {})
      if options[:id]
        resp = @connection.get "#{object}/#{options[:id]}"
      elsif options.size > 0
        resp = @connection.get "#{object}#{Client.parse_options(options)}"
      else
        resp = @connection.get object
      end
      raise "Bad response: #{resp.status}" unless resp.status == 200
      Client.mash(JSON.parse(resp.body))
    end

    def applicants(options = {})
      get("applicants", options)
    end

    def jobs(options = {})
      get("jobs", options)
    end

    def activities(options = {})
      get("activities", options)
    end

    def contents(options = {})
      get("contents", options)
    end

    def users(options = {})
      get("users", options)
    end

    def tasks(options = {})
      get("tasks", options)
    end

    private
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
