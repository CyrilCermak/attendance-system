require 'roar/json'
module API::Representers::HolidaysRepresenter
  include Roar::JSON
  include Grape::Roar::Representer

  collection :entries, extend: API::Representers::HolidayRepresenter
end