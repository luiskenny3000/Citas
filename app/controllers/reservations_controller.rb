class ReservationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_filter :autorize, except: [:new]
  before_filter :autorize_teacher, only: [:new]

  # GET /reservations
  # GET /reservations.json
  def index
    if session[:user_type] == 'admin'
      @reservations = Reservation.all
    else
      @reservations = Teacher.find(session[:user_id]).reservations
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    $d = Date.strptime(params[:date],"%Y-%m-%d")
    $h = params[:hour]
    $t = params[:teacher]
    $r = params[:room]
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.date = $d
    @reservation.hour = $h
    @reservation.teacher_id = $t
    @reservation.room_id = $r

    respond_to do |format|
      if @reservation.save
        MailGeneratorMailer.notify_creation(Teacher.find(session[:user_id]), @reservation).deliver
        format.html { redirect_to reservations_path, notice: 'Reservación creada exitosamente.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to root_path, notice: 'Reservación actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    if session[:user_type] == 'admin'
      MailGeneratorMailer.notify_cancell_by_admin(Teacher.find(@reservation.teacher), @reservation).deliver
    else
      MailGeneratorMailer.notify_cancell(Teacher.find(@reservation.teacher), @reservation).deliver
    end
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Reservación eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:description, :teacher_id, :room_id, :observation_id, :date, :hour)
    end
end
