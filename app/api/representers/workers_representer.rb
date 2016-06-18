require 'roar/json'
module API
  module Representers
    module WorkersRepresenter
      include Roar::JSON
      include Grape::Roar::Representer

      collection :entries, extend: WorkerRepresenter, as: :workers
    end
  end
end



