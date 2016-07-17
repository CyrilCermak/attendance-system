Rails.application.routes.draw do
  # resources :holidays
  get 'sessions_controller/new'

  root 'dashboard#index'
  #ADMIN
  get 'admin/dashboard' => "admin/dashboard#index", as: :admin_dashboard
  get 'admin/time_table/:id' => "admin/time_tables#show" , as: :admin_time_table

  get 'admin/workers' => "admin/workers#index" ,as: :admin_workers
  get 'admin/worker/new' => "admin/workers#new" ,as: :admin_new_worker
  get 'admin/worker/:id' => "admin/workers#show" ,as: :admin_show_worker
  get '/worker/time_table/:id' => "time_tables#show", as: :time_table
  get 'admin/worker/edit/:id' => "admin/workers#edit", as: :admin_edit_worker
  patch 'admin/worker/edit/:id' => "admin/workers#update", as: :admin_update_worker
  delete 'admin/worker/delete/:id' => "admin/workers#destroy", as: :admin_delete_worker
  post 'admin/workers/new' => "admin/workers#create" ,as: :admin_create_worker

  get 'admin/holidays' => "admin/holidays#index", as: :admin_holidays
  get 'admin/holidays/calendar' => "admin/holidays#show_calendar", as: :admin_holidays_cal
  get 'admin/holiday/:id' => "admin/workers#show_holidays", as: :admin_show_holiday
  get 'admin/holiday' => "admin/holidays#index", as: :admin_show_holidays
  get 'admin/holiday/show/:id' => "admin/holidays#show", as: :admin_holiday_detail
  get 'admin/holidays/new' => "admin/holidays#new", as: :admin_new_holiday
  post 'admin/holidays/new' => "admin/holidays#create", as: :admin_create_holiday
  get 'admin/holiday/approve/:id' => "admin/holidays#approved", as: :admin_approve_holiday
  patch'admin/holiday/edit/:id' => "admin/holidays#edit", as: :admin_edit_holiday
  delete 'admin/holiday/delete/:id' => "admin/holidays#destroy", as: :admin_delete_holiday

  get 'admin/company' => "admin/companys#index", as: :admin_companys
  post 'admin/company/department/new' => "admin/companys#create_department", as: :admin_create_department
  post 'admin/company/position/new' => "admin/companys#create_position", as: :admin_create_position
  post 'admin/company/position/update/:id' => "admin/companys#update_position", as: :admin_update_position
  delete 'admin/company/position/delete/:id' => "admin/companys#delete_position", as: :admin_delete_position

  get 'admin/contacts' => "admin/contacts#index", as: :admin_contacts

  get 'admin/attendance' => "admin/attendance#index", as: :admin_attendance
  post 'admin/attendance' => "admin/attendance#index", as: :admin_attendance_show_worker

  devise_for :users
  devise_for :workers

  mount API::Core => "/api"
  mount GrapeSwaggerRails::Engine => '/swagger'
end
