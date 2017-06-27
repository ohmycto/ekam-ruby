module Ekam
  class Error < StandardError
    attr_reader :code, :error, :request_params

    def initialize(code, error, request_params)
      super "Ekam responded with status #{code} (#{error})"
      @error = error
      @code = code
      @request_params = request_params
    end
  end
end