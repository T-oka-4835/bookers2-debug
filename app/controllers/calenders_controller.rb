class CalendersController < ApplicationController
  
  def index
    @calender = Calender.all
  end
  
  def show
    @calender = Calender.find(params[:id])
  end 
    
  def new
    @calender = Calender.new
  end 
  
  def create 
    Calender.create(calender_params)
    redirect_to calender_path 
  end 
  
  def edit 
    @calender = Calender.find(params[:id])
  end 
  
  def update
    @calender = Calender.find(params[:id])
    if @calender.update(calender_parameter)
      redirect_to calenders_path, notice: "編集しました"
    else 
      render 'edit'
    end 
  end 
    
  def destroy
    @calender = Calender.find(params[:id])
    @calender.destroy 
    redirect_to calenders_path, notice:"削除しました"
  end 
  
  private 
  
  def calender_parameter 
    params.require(:calender).permit(:title, :content, :start_time)
  end 
  
end
