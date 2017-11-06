class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    # redirect_to root_url if item.user != current_user
  end

  # GET /items/new
  def new
    @item = Item.new

  end

  # GET /items/1/edit
  def edit
    # Have blank item form if the user hasn't created any
    @item = Item.new(user: current_user) if @item.nil?
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.user = current_user

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
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
    # You can only edit your own items
    if @item.nil? || @item.user != current_user
      redirect_to root_url
    elsif @item.update(item_params)
      respond_to do |format|
        format.html { redirect_to items_path, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      end
    else
      format.html { render :edit }
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_item
    # if params[:id]
      # @item = Item.find_by!(user: params[:id])
    # else
      @item = Item.find_by(user: current_user)
    # end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:user_id, :title, :category, :description, :problem, :photo, :remove_photo)
  end
end