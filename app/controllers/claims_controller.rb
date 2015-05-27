class ClaimsController < ApplicationController
 
  def create
     @item = Item.find(params[:item_id])
     @claim = current_user.build_claim(item: @item)
 
      if @claim.save 
       flash[:notice] = "You have claimed\"#{@item.name}\". Make sure to un-claim this item should anything change."
       redirect_to [@item]
     else
       flash[:error] = "There was an error claiming this item. Please try again."
       redirect_to [@item]
     end
   end


  def destroy

  end

end
