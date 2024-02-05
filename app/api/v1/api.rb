# frozen_string_literal: true

module V1
  # This is the API class for version 1.
  class Api < Grape::API
    version 'v1', using: :path
  end
end
