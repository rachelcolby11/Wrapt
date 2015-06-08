class ExclusionsController < ApplicationController

  def create
     @item = Item.find(params[:item_id])
     @user = current_user

     @exclusion = Exclusion.create(user: @user.buddy, item: @item)
 
      if @exclusion.save 
       flash[:notice] = "You have restricted \"#{buddy.name}\" from viewing \"#{@item.name}\""
       redirect_to restrictions_item_path
     else
       flash[:error] = "There was an error. Please try again."
       redirect_to restrictions_item_path
     end
  end

  def destroy
  end

end