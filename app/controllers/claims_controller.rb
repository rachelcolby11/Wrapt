class ClaimsController < ApplicationController

  def create
     @item = Item.find(params[:item_id])
     @claim = Claim.create(user: current_user, item: @item)
 
      if @claim.save 
       flash[:notice] = "You have claimed \"#{@item.name}\". Make sure to unclaim this item should anything change."
       redirect_to @item
     else
       flash[:error] = "There was an error claiming this item. Please try again."
       redirect_to @item
     end
   end


  def destroy
    @item = Item.find(params[:item_id])
    @claim = Claim.find(params[:id])

    if @claim.destroy
       flash[:notice] = "You have unclaimed \"#{@item.name}\"."
       redirect_to @item
     else
       flash[:error] = "There was an error. Please try again."
       redirect_to @item
     end
  end

end
