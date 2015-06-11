class ExclusionsController < ApplicationController

  def create
   @item = Item.find(params[:item_id])
   @buddy = current_user.buddies.find(params[:buddy_id])
   @exclusion = Exclusion.new(user_id: @buddy.id, item: @item) 
   authorize @exclusion
   
   if @exclusion.save 
     flash[:notice] = "You have restricted \"#{@buddy.name}\" from viewing \"#{@item.name}\"."         
   else
     flash[:error] = "There was an error. Please try again."
   end
   redirect_to restrictions_item_path(@item)

  end

  def destroy
   @item = Item.find(params[:item_id])
   @exclusion = Exclusion.find(params[:id])
   @buddy = current_user.buddies.find(@exclusion.user_id)
   authorize @exclusion
   
   if @exclusion.destroy 
     flash[:notice] = "\"#{@buddy.name}\" can now view \"#{@item.name}\"."         
   else
     flash[:error] = "There was an error. Please try again."
   end

   redirect_to restrictions_item_path(@item)
  end
  
  private
 
   def exclusion_params
     params.require(:exclusion).permit(:item_id, :buddy_id, :user_id)
   end
end