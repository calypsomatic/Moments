class MomentsController < ApplicationController
  before_action :set_moment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /moments
  # GET /moments.json
  def index
    date = Chronic.parse(params[:date]).try(:to_date)
    @moments = Moment.makeMomentMonth(current_user, date: date)
  end
  
  # GET /moments/1
  # GET /moments/1.json
  def show
  end

  # GET /moments/new
  def new
    @moment = Moment.new
  end

  # GET /moments/1/edit
  def edit
  end

  # POST /moments
  # POST /moments.json
  def create
    @moment = current_user.moments.new(moment_params)

    respond_to do |format|
      if @moment.save
        format.html { redirect_to @moment, notice: 'Moment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @moment }
      else
        format.html { render action: 'new' }
        format.json { render json: @moment.errors, status: :unprocessable_entity }
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
