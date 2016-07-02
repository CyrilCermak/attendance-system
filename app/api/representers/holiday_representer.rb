require 'roar/json'
module API::Representers::HolidayRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  property :id
  property :name
  property :start
  property :end
end
