# frozen_string_literal: true

# The ApplicationHelper module is designed to provide utility methods
# that can be used across the application. It currently includes a
# method for retrieving nested values from a hash or an array of hashes.
module ApplicationHelper
  def get_nested_value(obj, key)
    if obj.respond_to?(:key?) && obj.key?(key)
      obj[key]
    elsif obj.respond_to?(:each)
      res = nil
      obj.find { |*a| res = get_nested_value(a.last, key) }
      res
    end
  end
end
