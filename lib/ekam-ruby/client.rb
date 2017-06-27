require 'uri'
require 'httparty'

module Ekam
  class Client
    include HTTParty

    base_uri "https://app.ekam.ru/api/online"

    attr_reader :token

    def initialize(token)
      @token = token
    end

    def get_receipt_requests(params = {})
      resource_url = "/v1/receipt_requests"
      get_resource(resource_url, params)["items"]
    end

    def create_receipt_request!(params)
      resource_url = "/v1/receipt_requests"
      post_resource(resource_url, params)
    end

    def close_shift!
      resource_url = "/v1/receipt_requests/close_retail_shift"
      post_resource(resource_url)
    end

    private

    def post_resource(resource_url, params = {})
      response = self.class.post(resource_url, body: params.to_json, headers: request_headers)
      status = response.code
      if status != 201
        raise Ekam::Error.new(status, response["error"], params)
      end
      response
    end

    def get_resource(resource_url, params = {})
      response = self.class.get(resource_url, query: params, headers: request_headers)
      status = response.code
      if status != 200
        raise Ekam::Error.new(status, response["error"], params)
      end
      response
    end

    def request_headers
      {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        'X-Access-Token' => token
      }      
    end

  end
end