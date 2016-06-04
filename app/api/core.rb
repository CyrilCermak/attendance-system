class API::Core < Grape::API
  mount API::Endpoints::Users
end