# frozen_string_literal: true

require 'grape-swagger'
module V1
  # This is the root API class.
  class RootApi < Grape::API
    format :json
    prefix :api

    helpers do
      def permitted_params
        @permitted_params ||= declared(params, included: false)
      end
    end

    mount ::V1::Api

    add_swagger_documentation \
      host: ENV.fetch('SWAGGER_HOST'),
      doc_version: '0.0.1',
      base_path: '/v1/docs',
      add_base_path: true,
      add_version: true,
      info: {
        title: 'Weather API',
        contact_url: 'https:/localhost:3000'
      },
      array_use_braces: true
  end
end