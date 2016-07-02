class API::Endpoints::Holidays < Grape::API

  resources :holidays do
    get do
      holidays = Holiday.all.each { |h| h.name = "#{h.worker.full_name} - #{h.name}" }
      present holidays
    end
  end

end