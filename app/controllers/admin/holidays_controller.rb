class Admin::HolidaysController < AdminController
  before_action :set_holiday, only: [:show, :edit, :update, :destroy, :approved]

  # GET /holidays
  # GET /holidays.json
  def index
    @holidays = Holiday.all
    @holidays_for_review = Holiday.where(reviewed: false)
    @holidays_reviewed = Holiday.where(reviewed: true).sort_by { |holiday| holiday.worker.first_name }
  end

  # GET /holidays/1
  # GET /holidays/1.json
  def show
  end

  # GET /holidays/new
  def new
    @holiday = Holiday.new
  end

  # GET /holidays/1/edit
  def edit
  end

  # POST /holidays
  # POST /holidays.json
  def create
    h_p = params[:holiday]
    @holiday = Holiday.new
    @holiday.name = h_p[:name]
    s = "#{h_p["start(1i)"]}-#{h_p["start(2i)"]}-#{h_p["start(3i)"]} #{h_p["start(4i)"]}:#{h_p["start(5i)"]}"
    e = "#{h_p["end(1i)"]}-#{h_p["end(2i)"]}-#{h_p["end(3i)"]} #{h_p["end(4i)"]}:#{h_p["end(5i)"]}"
    @holiday.start = Time.parse(s)
    @holiday.end = Time.parse(e)
    @holiday.worker = Worker.find_by(id: h_p[:worker_id])
    respond_to do |format|
      if @holiday.save
        format.html { redirect_to admin_holidays_path, notice: 'Holiday was successfully created.' }
        format.json { render :show, status: :created, location: admin_holidays_path }
      else
        format.html { render :new }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /holidays/1
  # PATCH/PUT /holidays/1.json
  def update
    respond_to do |format|
      if @holiday.update(holiday_params)
        format.html { redirect_to @holiday, notice: 'Holiday was successfully updated.' }
        format.json { render :show, status: :ok, location: @holiday }
      else
        format.html { render :edit }
        format.json { render json: @holiday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /holidays/1
  # DELETE /holidays/1.json
  def destroy
    @holiday.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Holiday was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def approved
    respond_to do |format|
      if @holiday.update(reviewed: true)
        format.html { redirect_to admin_holidays_path, notice: 'Holiday was approved.' }
      else
        format.html { redirect_to admin_holidays_path, notice: 'Error with approving holiday.' }
      end
    end
  end

  def show_calendar
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_holiday
    @holiday = Holiday.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def holiday_params
    params.require(:holiday).permit(:start, :end, :name, "start(1i)", "start(2i)", "start(3i)", "start(4i)", "start(5i)", "end(1i)", "end(2i)", "end(3i)", "end(4i)", "end(5i)", "worker_id")

  end
end
