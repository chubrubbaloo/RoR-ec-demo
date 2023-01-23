class ClassmatesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_classmate, only: %i[ show edit update destroy ]

  before_action :correct_user, only: [:show,:edit, :update, :destroy]

  # GET /classmates or /classmates.json
  def index
    @classmates = Classmate.all

    @q = Classmate.ransack(params[:q])
    @classmates = @q.result(distinct: true)
  end

  # GET /classmates/1 or /classmates/1.json
  def show
  end

  # GET /classmates/new
  def new
    @classmate = Classmate.new
  end

  # GET /classmates/1/edit
  def edit
  end

  # POST /classmates or /classmates.json
  def create
    @classmate = Classmate.new(classmate_params)
    @classmate.user = current_user

    respond_to do |format|
      if @classmate.save
        format.html { redirect_to classmates_path}
        format.json { render :show, status: :created, location: @classmate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classmate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classmates/1 or /classmates/1.json
  def update
    respond_to do |format|
      if @classmate.update(classmate_params)
        format.html { redirect_to classmates_path }
        format.json { render :show, status: :ok, location: @classmate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classmate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classmates/1 or /classmates/1.json
  def destroy
    @classmate.destroy

    respond_to do |format|
      format.html { redirect_to classmates_url }
      format.json { head :no_content }
    end
  end

  private

  private
  def correct_user
    classmate = Classmate.find(params[:id])
    unless classmate.user == current_user
      redirect_to classmates_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classmate
      @classmate = Classmate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classmate_params
      params.require(:classmate).permit(:first_name, :last_name, :email, :phone)
    end
end
