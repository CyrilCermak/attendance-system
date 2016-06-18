require 'roar/json'
module WorkerRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :id
  property :mac
  property :ip
  property :state
end
