class API::Core < Grape::API
  format :json
  formatter :json, Grape::Formatter::Roar

  mount API::Endpoints::Users
  mount API::Endpoints::Workers
  mount API::Endpoints::Holidays
end