class MomentsController < ApplicationController
  before_action :set_moment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /moments
  # GET /moments.json
  def index
    date = Chronic.parse(params[:date]).try(:to_date)
    @cal_days = Moment.makeMomentMonth(user: current_user, date: date)
  end
  
  # GET /moments/1
  # GET /moments/1.json
  def show
    @art = @moment.build_art(user: current_user)
  end

  # GET /moments/new
  def new
    @moment = Moment.new
  end

  # GET /moments/1/edit
  def edit
  end

  def universal
    date = Chronic.parse(params[:date]).try(:to_date)
    @cal_days = Moment.makeMomentMonth(date: date)
  end

  # POST /moments
  # POST /moments.json
  def create
    @moment = current_user.moments.build(moment_params)

    respond_to do |format|
      if @moment.save
        flash[:notice] = "Moment was successfully created"
        format.html { redirect_to action: 'index' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /moments/1
  # PATCH/PUT /moments/1.json
  def update
    respond_to do |format|
      if @moment.update(moment_params)
        format.html { redirect_to @moment, notice: 'Moment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moments/1
  # DELETE /moments/1.json
  def destroy
    @moment.destroy
    respond_to do |format|
      format.html { redirect_to moments_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moment
      @moment = Moment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def moment_params
      params.require(:moment).permit(:sentence, :day)
    end
end
