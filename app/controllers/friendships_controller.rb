class FriendshipsController < ApplicationController

  def index
    
  end
  
  def create
    existing_user = User.find_by_email(params[:email])

    if existing_user.nil?
      # this is someone not in the system -> create them and invite them
      # maybe ask for confirmation to send invite.
      @user_new = User.new(email: params[:email], password: "password")
      @user_new.skip_confirmation!

        if @user_new.save
          flash[:notice] = "This person has not joined Wrapt. An invitation to join will be sent to the email you provided."
          @user_new.send_email_invite_from(current_user)
          redirect_to friendships_path(current_user)
        else
          flash[:error] = "There was an error. Please try again."
          redirect_to friendships_path(current_user)
        end

    elsif existing_user.friended_by.include?(current_user)
      # friendship already exists, do not create new friendship
      flash[:error] = "\"#{existing_user.name}\" is already your friend."
      redirect_to friendships_path(current_user)

    else
      # create friendship between current_user and existing_user
      @friendship = Friendship.new(user: current_user, buddy: existing_user)

        if @friendship.save
          flash[:notice] = "Your friends list was updated."
          redirect_to friendships_path(current_user)
        else
          flash[:error] = "There was an error adding your friend. Please try again."
          redirect_to friendships_path(current_user)
        end
    end

  end

  def destroy
    @friendship = Friendship.find(params[:id])
    if @friendship.destroy
      flash[:notice] = "\"#{@friendship.buddy.name}\" was removed from your friends list."
      redirect_to friendships_path(current_user)
    else
      flash[:error] = "There was an error. Please try again."
      redirect_to friendships_path(current_user)
    end
  end

end