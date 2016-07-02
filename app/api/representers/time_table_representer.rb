require 'roar/json'
module API::Representers::TimeTableRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :id
  property :start
  property :end
end
