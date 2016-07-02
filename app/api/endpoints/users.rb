
class API::Endpoints::Users < Grape::API
  include Authentication
  include Formatter

  resource :users do

    params do
      requires :email, type: String
      requires :password, type: String
    end
    post :login do
      user = User.where("lower(email) = ?", params[:email].strip.downcase).first
      if user
        if user.valid_password?(params[:password])
          user
        else
          error! "Credentials invalid", 400
        end
      else
        error! "Invalid users", 400
      end
    end

    params do
      requires :token, type: String
    end
    get :test do
      {test: "test"}
    end
    get :test2 do
      {test2: "test2"}
    end
    get :workers do
      Worker.all
    end

  end

end