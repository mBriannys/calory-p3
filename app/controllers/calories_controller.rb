class CaloriesController < ApplicationController
  before_action :authenticate_user!
  def index
    if params[:search].blank? and params[:date].blank? and params[:dates].blank?
      @calories = Calory.where(user_id: current_user.id)
      @calories = @calories.page params[:page]
    else
      word = params[:search].to_s
      date_start = params[:dates].to_s.to_date
      date_end = params[:date].to_s.to_date
      @calories = Calory.where(user_id: current_user.id).where("date BETWEEN (?) AND (?)", "%#{date_start}%", "%#{date_end}%")
      @calories = Calory.where(user_id: current_user.id).where("comment_burned like (?) OR comment_ingested like (?)", "%#{word}%", "%#{word}%")
      @calories = @calories.page params[:page]
    end
  end

  def new
    @calory = Calory.new
  end

  def create
    @calory = Calory.new(calory_params)
    @calory.user_id = current_user.id
    @calory.date = Date.today
    if @calory.valid?
      @calory.save
      flash[:success] = "Successfully calorie log"
      redirect_to root_path
    end
  end

  def destroy
    @calory = Calory.find(params[:id])
    if @calory.destroy
      flash[:success] = "The to-do item was successfully destroyed."
      redirect_to root_path
    else
      flash[:error] = "Something was wrong."
      redirect_to root_path
    end
  end

  def show
    @calory = Calory.find(params[:id])
  end

  def edit
    @calory = Calory.find(params[:id])
  end

  def update
    @calory = Calory.find(params[:id])
    respond_to do |format|
     if @calory.update(calory_params)
       format.html { redirect_to @calory, notice: "Progress was successfully updated." }
       format.json { render :show, status: :ok, location: @calory }
     else
       format.html { render :edit, status: :unprocessable_entity }
       format.json { render json: @calory.errors, status: :unprocessable_entity }
     end
   end
  end

  def search

  end

  private
    def calory_params
        params.require(:calory).permit(:burned_calories, :comment_burned,  :ingested_calories, :comment_ingested)
    end
end
