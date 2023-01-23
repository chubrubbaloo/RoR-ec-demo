class GradesController < ApplicationController
  before_action :authenticate_user!

  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  before_action :set_grade, only: %i[ show edit update destroy ]


  # GET /grades or /grades.json
  def index
    @grades = Grade.all

    @q = Grade.ransack(params[:q])
    @grades = @q.result(distinct: true)
  end

  # GET /grades/1 or /grades/1.json
  def show
  end

  # GET /grades/new
  def new
    @grade = Grade.new
  end

  # GET /grades/1/edit
  def edit
  end

  # POST /grades or /grades.json
  def create
    @grade = Grade.new(grade_params)
    @grade.user = current_user

    respond_to do |format|
      if @grade.save
        format.html { redirect_to grades_path}
        format.json { render :show, status: :created, location: @grade }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grades/1 or /grades/1.json
  def update
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to grades_path}
        format.json { render :show, status: :ok, location: @grade }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grades/1 or /grades/1.json
  def destroy
    @grade.destroy

    respond_to do |format|
      format.html { redirect_to grades_url }
      format.json { head :no_content }
    end
  end

  def correct_user
    @grade = current_user.grades.find_by(id: params[:id])
    redirect_to grades_path, notice: "Not Authorized To Edit This grade!" if @grade.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grade
      @grade = Grade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grade_params
      params.require(:grade).permit(:code, :course, :points, :grade)
    end
end
