class ClaimsController < ApplicationController

  def create
     @item = Item.find(params[:item_id])
     @claim = Claim.create(user: current_user, item: @item)
     authorize @claim
 
     if @claim.save 
       flash[:notice] = "You have claimed \"#{@item.name}\". Make sure to unclaim this item should anything change."
       redirect_to (:back)
     else
       flash[:error] = "There was an error claiming this item. Please try again."
       redirect_to (:back)
     end
   end

  def destroy
    @item = Item.find(params[:item_id])
    @claim = Claim.find(params[:id])
    authorize @claim

    if @claim.destroy
       flash[:notice] = "You have unclaimed \"#{@item.name}\"."
       redirect_to (:back)
     else
       flash[:error] = "There was an error. Please try again."
       redirect_to (:back)
     end
  end

end
