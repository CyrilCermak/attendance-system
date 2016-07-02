class API::Endpoints::Workers < Grape::API

  resources :workers do
    get do
      present Worker.all, with: API::Representers::WorkersRepresenter
    end
    params do
      requires :state, type: Boolean
      requires :mac, type: String
    end
    patch do
      w = Worker.find_by_mac(params[:mac])
      if w.status_changed(params[:state])
        status 204
      else
        error("Could not save worker status", 400)
      end
    end

    route_param :id do
      get do
        present Worker.find_by(id: params[:id]), with: API::Representers::WorkerRepresenter
      end

      #########################
      get :tables do
        records = []
        Worker.find_by(id: params[:id]).time_tables.each do |table|
          records << {id: table.id, start: table.start, end: table.end, title: "At work"}
        end
        present records
      end

      get :holidays do
        records = []
        Worker.find_by(id: params[:id]).holidays.each do |hol|
          records << {id: hol.id, start: hol.start, end: hol.end, name: hol.name, title: "Holiday"}
        end
        present records
      end
      ########################

    end

  end

end