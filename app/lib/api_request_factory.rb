# frozen_string_literal: true

module AccueWeather
  # The ApiRequestFactory class is responsible for building and providing API request parameters
  # for AccuWeather's API calls. It encapsulates the logic for creating parameter hashes that are
  # required to interact with the various endpoints of the AccuWeather API. This class aims to
  # abstract the complexity of parameter creation and provide a simple interface for generating
  # requests specific to different API functionalities, such as fetching unique identifiers for cities.
  class ApiRequestFactory
    def uniq_id(city)
      generic_request.merge(
        q: city,
        offset: 0,
        alias: false
      )
    end

    private

    def generic_request
      {
        apiKey: ENV.fetch('ACCUE_WEATHER_API_KEY'),
        language: 'en-us',
        details: false
      }
    end
  end
end
