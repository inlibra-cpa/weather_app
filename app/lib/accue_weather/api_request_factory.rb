# frozen_string_literal: true

module AccueWeather
  # The ApiRequestFactory class is responsible for building and providing API request parameters
  # for AccuWeather's API calls. It encapsulates the logic for creating parameter hashes that are
  # required to interact with the various endpoints of the AccuWeather API. This class aims to
  # abstract the complexity of parameter creation and provide a simple interface for generating
  # requests specific to different API functionalities, such as fetching unique identifiers for cities.
  class APIRequestFactory
    def uniq_id(city)
      generic_request.merge(
        q: city,
        offset: false,
        alias: false
      )
    end

    def current_temperature
      generic_request
    end

    def historical_temperature
      generic_request
    end

    private

    def generic_request
      {
        apikey: ENV.fetch('ACCUE_WEATHER_API_KEY'),
        language: 'en',
        details: false
      }
    end
  end
end
