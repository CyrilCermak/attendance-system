module API::Authentication
  extend ActiveSupport::Concern

  included do
    helpers Helpers
    before do
      authenticate!
    end
  end

end