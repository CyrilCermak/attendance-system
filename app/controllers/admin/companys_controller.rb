class Admin::CompanysController < AdminController

  def index
    @departments = Department.all
    @positions = Position.all
  end

  def delete_position
    @position = Position.find_by(id: params[:id])
    @position.destroy!
    respond_to do |format|
      format.html { redirect_to admin_companys_path, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_position
    @position = Position.find_by(id: params[:id])
    @position.update(position_params)
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to admin_companys_path, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_position
    @position = Position.new(position_params)
    @position.department = Department.find_by(id: params[:position][:department_id])
    @position.workers = workers_by_ids
    respond_to do |format|
      if @position.save
        format.html { redirect_to admin_companys_path, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: admin_companys_path }
      else
        format.html { render :new }
        format.json { render json: admin_companys_path, status: :unprocessable_entity }
      end
    end
  end

  def create_department
    @department = Department.new(department_params)
    @department.positions = positions_by_ids
    respond_to do |format|
      if @department.save
        format.html { redirect_to admin_companys_path, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: admin_companys_path }
      else
        format.html { render :new }
        format.json { render json: admin_companys_path, status: :unprocessable_entity }
      end
    end
  end


  private

  def workers_by_ids
    workers = []
    params[:position][:worker_ids].each do |id|
      if id != ""
        workers << Worker.find_by(id: id)
      end
    end
    workers
  end

  def positions_by_ids
    positions = []
    params[:department][:position_ids].each do |id|
      if id != ""
        positions << Position.find_by(id: id)
      end
    end
    positions
  end

  def department_params
    params.require(:department).permit(:name, :floor, :position_ids)
  end

  def companys_params
    params.require(:department).permit(:name, :floor, :position_ids)
  end

  def position_params
    params.require(:position).permit(:name, :wage, :workers)
  end

end
