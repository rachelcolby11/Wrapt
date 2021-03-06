class FriendshipsController < ApplicationController
  
  def create
    existing_user = User.find_by_email(params[:email])

    if existing_user.nil?
      # this is someone not in the system -> create them and invite them
      @user_new = User.new(name: params[:email], email: params[:email], password: "password")
      @user_new.skip_confirmation!

        if @user_new.save
          @friendship = Friendship.create(user: current_user, buddy: @user_new)
          authorize @friendship
          
          flash[:notice] = "This person has not joined Wrapt. An invitation to join will be sent to \"#{@user_new.name}\"."
          @user_new.send_email_invite_from(current_user)
          redirect_to (:back)
        else
          flash[:error] = "There was an error adding this person. Please try again."
          redirect_to (:back)
        end

    elsif existing_user.friended_by.include?(current_user)
      # friendship already exists, do not create new friendship
      flash[:error] = "\"#{existing_user.name}\" is already your friend."
      redirect_to (:back)

    else
      # create friendship between current_user and existing_user
      @friendship = Friendship.new(user: current_user, buddy: existing_user)
      authorize @friendship

        if @friendship.save
          flash[:notice] = "\"#{existing_user.name}\" was added to your friends list."
          redirect_to (:back)
        else
          flash[:error] = "There was an error adding your friend. Please try again."
          redirect_to (:back)
        end
    end

  end

  def destroy
    @friendship = Friendship.find(params[:id])
    authorize @friendship
    if @friendship.destroy
      flash[:notice] = "\"#{@friendship.buddy.name}\" was removed from your friends list."
      redirect_to friendships_path(current_user)
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to friendships_path(current_user)
    end
  end

end