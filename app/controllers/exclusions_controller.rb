class ExclusionsController < ApplicationController

  def create
   @item = Item.find(params[:item_id])
   @buddy = current_user.buddies.find(params[:buddy_id])
   @exclusion = Exclusion.new(user_id: @buddy.id, item: @item) 
   
   if @exclusion.save 
     flash[:notice] = "You have restricted \"#{@buddy.name}\" from viewing \"#{@item.name}\""         
   else
     flash[:error] = "There was an error. Please try again."
   end
   redirect_to restrictions_item_path(@item)

  end

  def destroy
   @item = Item.find(params[:item_id])
   @buddy = current_user.buddies.find(params[:buddy_id])
   @exclusion = Exclusion.where(user_id: @buddy.id, item: @item).first
   
   if @exclusion.destroy 
     flash[:notice] = "\"#{@buddy.name}\" can now view \"#{@item.name}\""         
   else
     flash[:error] = "There was an error. Please try again."
   end

   redirect_to restrictions_item_path(@item)
  end

end