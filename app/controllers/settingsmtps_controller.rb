class SettingsmtpsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_settingsmtp, only: [:show, :edit, :update, :destroy]

  # GET /settingsmtps
  # GET /settingsmtps.json
  def index
    @settingsmtps = Settingsmtp.where('user_id = ?',current_user.id)
  end

  # GET /settingsmtps/1
  # GET /settingsmtps/1.json
  def show
  end

  # GET /settingsmtps/new
  def new
    @settingsmtp = Settingsmtp.new
  end

  # GET /settingsmtps/1/edit
  def edit
  end

  # POST /settingsmtps
  # POST /settingsmtps.json
  def create
    @settingsmtp = Settingsmtp.new(settingsmtp_params)

    respond_to do |format|
      if @settingsmtp.save
        format.html { redirect_to @settingsmtp, notice: 'SMTP details was successfully created.' }
        format.json { render :show, status: :created, location: @settingsmtp }
      else
        format.html { render :new }
        format.json { render json: @settingsmtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settingsmtps/1
  # PATCH/PUT /settingsmtps/1.json
  def update
    respond_to do |format|
      if @settingsmtp.update(settingsmtp_params)
        format.html { redirect_to @settingsmtp, notice: 'SMTP details  was successfully updated.' }
        format.json { render :show, status: :ok, location: @settingsmtp }
      else
        format.html { render :edit }
        format.json { render json: @settingsmtp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settingsmtps/1
  # DELETE /settingsmtps/1.json
  def destroy
    @settingsmtp.destroy
    respond_to do |format|
      format.html { redirect_to settingsmtps_url, notice: 'SMTP details  was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_settingsmtp
      @settingsmtp = Settingsmtp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def settingsmtp_params
      params.require(:settingsmtp).permit(:hostaddress, :post, :user_name, :password, :enable_ssl, :protocol,:user_id)
    end
end
