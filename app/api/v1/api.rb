# frozen_string_literal: true

module V1
  # This is the API class for version 1.
  class API < Grape::API
    version 'v1', using: :path

    mount V1::Weather
    mount Backend
  end
end
