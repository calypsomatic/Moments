class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]

  # GET /arts
  # GET /arts.json
  def index
    #@moment = Moment.find(params[:moment_id])
    #@arts = current_user.arts.where(moment_id: @moment.id)
    @arts = Art.where(user: current_user)
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
  end

  # GET /arts/new
  def new
    @art = Art.new
    @moment = params[:moment]
  end

  # GET /arts/1/edit
  def edit
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)
    @moment = @art.moment
    @in_progress = Art.in_progress?(current_user)

    respond_to do |format|
      if @in_progress
        format.html { redirect_to moment_path(@moment), notice: "You already have an art in progress" }
      elsif @art.save
        format.html { redirect_to moment_art_path(@moment, @art), notice: "You have claimed this moment's art!" }
      else
        format.html { render action: 'new' }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to @art, notice: 'Art was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_params
      params.require(:art).permit(:user_id, :moment_id)
    end
end
