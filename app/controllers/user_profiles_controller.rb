class UserProfilesController < ApplicationController
  def new
    @user_profile = UserProfile.new
    @user_profile.user = @user
  end

  def create
    # @user_profile = UserProfile.new
    @user_profile = current_user.user_profiles.build(user_profile_params)
    @user_profile.user = @user
    # @user =  current_user
     if @user_profile.save
       flash[:notice] = "Your profile was saved."
       redirect_to @user_profile
     else
       flash[:error] = "There was an error. Please try again."
       render :new
     end
   end

  def edit
    @user_profile.user = @user
    @user_profile = UserProfile.find(params[:id])
  end

   def update
    @user_profile.user = @user
    @user_profile = UserProfile.find(params[:id])

    @user_profile.update_attributes(user_profile_params)
    if @user_profile.update_attributes(user_profile_params)
      flash[:notice] = "User information updated"
       redirect_to @user_profile
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_profile_path
    end 
   end

  def show
    @user_profile = UserProfile.find(params[:id])
    @user_profile.user = @user
  end

  def destroy
  end

  private
 
   def user_profile_params
     params.require(:user).permit(:name, :birthday, :favorite_color, :favorite_small_gifts, :desired_gift_cards, :notes)
   end
 end