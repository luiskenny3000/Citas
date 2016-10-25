class ResoucesController < ApplicationController
  before_action :set_resouce, only: [:show, :edit, :update, :destroy]

  # GET /resouces
  # GET /resouces.json
  def index
    @resouces = Resouce.all
  end

  # GET /resouces/1
  # GET /resouces/1.json
  def show
  end

  # GET /resouces/new
  def new
    @resouce = Resouce.new
  end

  # GET /resouces/1/edit
  def edit
  end

  # POST /resouces
  # POST /resouces.json
  def create
    @resouce = Resouce.new(resouce_params)

    respond_to do |format|
      if @resouce.save
        format.html { redirect_to @resouce, notice: 'Resouce was successfully created.' }
        format.json { render :show, status: :created, location: @resouce }
      else
        format.html { render :new }
        format.json { render json: @resouce.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resouces/1
  # PATCH/PUT /resouces/1.json
  def update
    respond_to do |format|
      if @resouce.update(resouce_params)
        format.html { redirect_to @resouce, notice: 'Resouce was successfully updated.' }
        format.json { render :show, status: :ok, location: @resouce }
      else
        format.html { render :edit }
        format.json { render json: @resouce.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resouces/1
  # DELETE /resouces/1.json
  def destroy
    @resouce.destroy
    respond_to do |format|
      format.html { redirect_to resouces_url, notice: 'Resouce was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resouce
      @resouce = Resouce.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resouce_params
      params.require(:resouce).permit(:name)
    end
end
