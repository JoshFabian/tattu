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
   
  def update
     @shot = Shot.find(params[:id])

     respond_to do |format|
       if @shot.update_attributes(params[:shot])
         format.html { redirect_to @shot, notice: 'Shot was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @shot.errors, status: :unprocessable_entity }
       end
     end
   end
  
end
