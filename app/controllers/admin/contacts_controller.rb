class Admin::ContactsController < AdminController

  def index
    @workers = Worker.all
  end

end
