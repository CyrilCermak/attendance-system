class Admin::WorkersController < AdminController
  before_action :set_worker, only: [:update, :destroy, :show_holidays]
  before_action :is_admin?, only: [:update, :destroy, :create, :new, :edit]

  def index
    @workers = Worker.all
  end

  def new
    @worker = Worker.new
  end

  def show
    respond_to do |format|
      format.js
      format.html
    end
  end

  # GET /workers/1/edit
  def edit
    @worker = Worker.find(params[:id])
  end

  # POST /workers
  # POST /workers.json
  def create
    @worker = Worker.new(worker_params)
    puts(params[:save])
    respond_to do |format|
      if @worker.save
        format.html { redirect_to admin_workers_path, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    respond_to do |format|
      if @worker.update!(worker_params)
        if params[:Save] == "Update User"
          format.html { redirect_to admin_workers_path, notice: 'Worker was successfully updated.' }
          format.json { render :show, status: :ok, location: @worker }
        else
          format.html { redirect_to admin_contacts_path, notice: 'Worker was successfully updated.' }
          format.json { render :show, status: :ok, location: @worker }
        end
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to admin_workers_path, notice: 'Worker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_holidays
    @holidays = @worker.holidays
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_worker
    @worker = Worker.find(params[:id])
  end

  def is_admin?
    puts "Checking admin #{current_user.admin?}"
    unless current_user.admin?
      redirect_to new_user_session_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def worker_params
    params.require(:worker).permit(:mac, :first_name, :ip, :mac, :state, :last_name, :email, :password, :position_id, :phone, :company_phone)
  end
end
