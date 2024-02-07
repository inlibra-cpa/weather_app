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
      @uniq_id ||= get_nested_value(response[:body], :Key)
    end

    def weather_text
      @weather_text ||= get_nested_value(response, :WeatherText)
    end

    def temperature
      @temperature ||= get_nested_value(response, :Metric)
    end

    def temperature_24_hours
      hash = {}

      response[:body].each_with_index do |v, i|
        key = Time.at(v['EpochTime']).to_datetime

        hash[key] = v['Temperature']['Metric'] if hash[key].blank?

        hash[key].merge(weather_text: weather_text)
      end
    end
  end
end
