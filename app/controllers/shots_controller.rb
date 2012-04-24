class ShotsController < ApplicationController
  def show
     @shot = Shot.find(params[:id])
   end
   
  def edit
    @shot = Shot.find(params[:id])
  end
  
  def create
    @shot = Shot.new(params[:shot])
    @shot.user_id = current_user.id
    if @shot.save
      redirect_to :back, :notice => "Shot was uploaded successfully!"
    else
      redirect :back, :alert => "It didn't work."
    end
  end
  
  def destroy
    @shot = Shot.find(params[:id]) 
    @shot.destroy 
    redirect_to :back, :notice => "Shot was deleted!"
  end
   
  def update_all
    @shot = Shot.find(params[:shot])
    @shot.update
    redirect_to :back, :notice => "Shot was updated!"
  end
  
end
