class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    authorize @items
  end

  # GET /items/new
  def new
    @item = Item.new
    authorize @item
  end

  # GET /items/1/edit
  def edit
    item = Item.find(params[:id])
    @redirect = params[:redirect].present? 
    authorize item
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user
    authorize @item

    respond_to do |format|
      if @item.save
        format.html { redirect_to user_path(current_user), notice: 'Your item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    place_to_go = params[:redirect].present? ? user_path(current_user) : items_path
    authorize @item

    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to place_to_go, notice: 'Your item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    authorize @item

    @item.destroy
    respond_to do |format|
      format.html { redirect_to (:back), notice: 'Item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def restrictions
    @item = Item.find(params[:id])
    authorize @item
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :notes, :size, :user_id)
    end
end
