
class API::Endpoints::Users < Grape::API
  include Authentication
  include Formatter

  resource :users do

    params do
      requires :email, type: String
      requires :password, type: String
    end
    get :login do
      user = User.where("lower(email) = ?", params[:email].strip.downcase).first
      if user.valid_password?(params[:password])
        user
      else
        error! "Credentials invalid", 400
      end
    end

    params do
      requires :token, type: String
    end
    get do
      {test: "test"}
    end

  end

end