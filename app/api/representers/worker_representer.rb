require 'roar/json'
module API::Representers::WorkerRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :id
  property :email
  property :first_name
  property :last_name
  property :mac
  property :ip
  property :state
end
