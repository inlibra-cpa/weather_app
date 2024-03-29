# frozen_string_literal: true

Rails.application.routes.draw do
  mount V1::RootAPI, at: '/'

  Rails.application.routes.default_url_options[:host] = ENV.fetch('HOST')

  root 'weather_infos#index'
end
