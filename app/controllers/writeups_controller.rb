class WriteupsController < ApplicationController
  before_action :set_writeup, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]

  # GET /writeups
  # GET /writeups.json
  def index
    @writeups = Writeup.all
  end

  # GET /writeups/1
  # GET /writeups/1.json
  def show
  end

  # GET /writeups/new
  def new
    @writeup = Writeup.new
  end

  # GET /writeups/1/edit
  def edit
  end

  # POST /writeups
  # POST /writeups.json
  def create
    @writeup = Writeup.new(writeup_params)

    respond_to do |format|
      if @writeup.save
        format.html { redirect_to root_path, notice: 'Writeup added.' }
        format.json { render :show, status: :created, location: @writeup }
      else
        format.html { render :new }
        format.json { render json: @writeup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /writeups/1
  # PATCH/PUT /writeups/1.json
  def update
    respond_to do |format|
      if @writeup.update(writeup_params)
        format.html { redirect_to @writeup, notice: 'Writeup was successfully updated.' }
        format.json { render :show, status: :ok, location: @writeup }
      else
        format.html { render :edit }
        format.json { render json: @writeup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /writeups/1
  # DELETE /writeups/1.json
  def destroy
    @writeup.destroy
    respond_to do |format|
      format.html { redirect_to writeups_url, notice: 'Writeup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_writeup
      @writeup = Writeup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def writeup_params
      params.require(:writeup).permit(:url, :caption, :description, :date)
    end
end
