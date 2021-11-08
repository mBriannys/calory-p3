class CaloriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @calories = Calory.where(user_id: current_user.id)
    @calories = @calories.page params[:page]
  end

  def new
    @calory = Calory.new
  end

  def create
    @calory = Calory.new(calory_params)
    @calory.user_id = current_user.id
    if @calory.valid?
      @calory.save
      flash[:success] = "Register yours calories!"
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
  private
    def calory_params
        params.require(:calory).permit(:burned_calories, :comment_burned,  :ingested_calories, :comment_ingested)
    end
end
