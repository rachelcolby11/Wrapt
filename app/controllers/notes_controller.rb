class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
     if @note.save
       flash[:notice] = "Your note was saved."
       redirect_to dashboard_path
     else
       flash[:error] = "There was an error saving your note. Please try again."
       render :new
     end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
   @note = Note.find(params[:id])
   if @note.update_attributes(note_params)
     flash[:notice] = "Your note has been updated."
     redirect_to dashboard_path
   else
     flash[:error] = "There was an error saving your note. Please try again."
     render :edit
   end
  end

  def destroy
  end

  def note_params
    params.require(:note).permit(:body)
  end
end