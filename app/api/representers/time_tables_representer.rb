require 'roar/json'
module API::Representers::TimeTablesRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  collection :entries, extend: API::Representers::TimeTableRepresenter
end