require 'roar/json'
module API::Representers::WorkersRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  collection :entries, extend: API::Representers::WorkerRepresenter, as: :workers
end



