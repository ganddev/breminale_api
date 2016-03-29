class Profile::BreminaleDatesController < ApplicationController
  before_action :set_breminale_date, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /breminale_dates
  # GET /breminale_dates.json
  def index
    @breminale_dates = current_user.breminale_dates.all
  end

  # GET /breminale_dates/1
  # GET /breminale_dates/1.json
  def show
  end

  # GET /breminale_dates/new
  def new
    @breminale_date = ::BreminaleDate.new
  end

  # GET /breminale_dates/1/edit
  def edit
  end

  # POST /breminale_dates
  # POST /breminale_dates.json
  def create
    @breminale_date = current_user.breminale_dates.new(breminale_date_params)

    respond_to do |format|
      if @breminale_date.save
        format.html { redirect_to [:profile, @breminale_date], notice: 'Datum erfolgreich angelegt' }
        format.json { render :show, status: :created, location: @breminale_date }
      else
        format.html { render :new }
        format.json { render json: @breminale_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /breminale_dates/1
  # PATCH/PUT /breminale_dates/1.json
  def update
    respond_to do |format|
      if @breminale_date.update(breminale_date_params)
        format.html { redirect_to [:profile, @breminale_date], notice: 'Datum erfolgreich geändert' }
        format.json { render :show, status: :ok, location: @breminale_date }
      else
        format.html { render :edit }
        format.json { render json: @breminale_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /breminale_dates/1
  # DELETE /breminale_dates/1.json
  def destroy
    @breminale_date.destroy
    respond_to do |format|
      format.html { redirect_to profile_breminale_dates_path, notice: 'Datum erfolgreich gelöscht' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_breminale_date
      @breminale_date = BreminaleDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def breminale_date_params
      params.require(:breminale_date).permit(:date_day)
    end
end
