# frozen_string_literal: true

# Top level module
module V1
  # Weather API
  class Weather < Grape::API
    CITY = 'Myrtle Beach'

    before do
      def client
        @client ||= ::AccueWeather::Client.new('Weather App')
      end

      def uniq_id
        @uniq_id ||= client.uniq_id(city: CITY).uniq_id
      end

      # def fetch_location_id(address)
      #   Rails.cache.fetch(address, expires_in: 30.minutes) do
      #     client.geocode_address(address: address).uniq_id
      #   end
      # end
    end

    resource :weather do # rubocop:disable Metrics/BlockLength
      # desc 'Get current temperature for a given address'
      # params do
      #   requires :address, type: String, desc: "The address to retrieve weather for."
      # end
      # get '/current' do
      #   address = permitted_params[:address]
      #   location_id = fetch_location_id(address)

      #   result = client.current_temperature(uniq_id: location_id)

      #   present address: address, city: result.city, text: result.weather_text, temperature: result.temperature,
      #           cached: result.cached
      # end

      desc 'get current temperature'
      get '/current' do
        result = client.current_temperature(uniq_id: uniq_id)

        present city: CITY, text: result.weather_text, temperature: result.temperature
      end

      namespace :historical do # rubocop:disable Metrics/BlockLength
        desc 'hourly temperature for the last 24 hours'
        get '/' do
          result = client.historical_temperature(uniq_id: uniq_id)

          present result.temperature_24_hour
        end

        desc 'maximum temperature in 24 hours'
        get '/max' do
          result = client.historical_temperature(uniq_id: uniq_id)

          present result.max_temp_in_24_hour
        end

        desc 'minimum temperature in 24 hours'
        get '/min' do
          result = client.historical_temperature(uniq_id: uniq_id)

          present result.min_temp_in_24_hour
        end

        desc 'average temperature in 24 hours'
        get '/avg' do
          result = client.historical_temperature(uniq_id: uniq_id)

          present result.avg_temp_in_24_hour
        end

        desc 'temperature closest to the passed timestamp'
        params { requires :query, type: String }
        get '/by_time' do
          result = client.historical_temperature(uniq_id: uniq_id)

          scope = result.temperature_24_hour
          timestamp = Time.at(params[:query].to_i).to_datetime

          response = result.closet_temperature(scope, timestamp)

          present day: timestamp, response: response
        end
      end
    end
  end
end
