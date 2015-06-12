class UserProfilesController < ApplicationController
  def new
    if current_user.user_profile
      redirect_to edit_user_profile_path(current_user)
      @user_profile = current_user.user_profile
    else
      @user_profile = UserProfile.new
    end  
    authorize @user_profile
  end

  def create
    @user_profile = current_user.build_user_profile(user_profile_params)
    authorize @user_profile
     if @user_profile.save
       flash[:notice] = "Your profile was saved."
       redirect_to @user_profile
     else
       flash[:error] = "There was an error. Please try again."
       render :new
     end
   end

  def edit
    @user_profile = current_user.user_profile
    authorize @user_profile
    @redirect = params[:redirect].present?
  end

   def update
    @user_profile = UserProfile.find(params[:id])
    authorize @user_profile
    @user_profile.update_attributes(user_profile_params)
    place_to_go = params[:redirect].present? ? user_path(current_user) : @user_profile
    if @user_profile.update_attributes(user_profile_params)
      flash[:notice] = "Your profile has been updated."
       redirect_to place_to_go
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_profile_path
    end 
   end

  def show
    @user_profile = UserProfile.find(params[:id])
    authorize @user_profile
    @user = @user_profile.user
  end

  private
 
   def user_profile_params
     params.require(:user_profile).permit(:user, :name, :birthdate, :favorite_color, :favorite_small_gifts, :desired_gift_cards, :notes)
   end
 end