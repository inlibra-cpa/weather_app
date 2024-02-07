# frozen_string_literal: true

module AccueWeather
  # This class encapsulates the response from an API call.
  # It provides access to the response object and includes methods
  # for retrieving a unique identifier from the response if available.
  class APIResponse
    include ApplicationHelper

    attr_accessor :response

    def initialize(response)
      @response = response
    end

    def uniq_id
      @uniq_id ||= get_nested_value(response, 'Key')
    end
  end
end
