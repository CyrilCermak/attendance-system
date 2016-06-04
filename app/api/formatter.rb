module API::Formatter
  extend ActiveSupport::Concern
  included do
    format :json
    content_type :json, "application/json"
  end
end