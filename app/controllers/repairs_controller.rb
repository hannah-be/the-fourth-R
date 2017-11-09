class RepairsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_repair, only: [:show]

  def index
    # Get the repairs the logged in user has requested
    @repairs = Repair.all
  end

  def show

  end

  def new
    #  New rental for our forms
    @repair = Repair.new
    # The item_id will come from the URL
    @repair.item = Item.find(params[:item_id])
    @repairers = Repairer.all
  end
  
  def create
    repair_params = params.require(:repair).permit(:item_id, :repairer_id, :user_id)
    # New repair to save to database
    @repair = Repair.new
    # The item_id comes from the form (hidden_tag :item_id)
    @repair.item = Item.find(repair_params[:item_id])
    @repair.repairer = Repairer.find(repair_params[:repairer_id])
    @repair.user_id = current_user
    
     @amount = 500
  
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :source  => params[:stripeToken]
    )
  
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => @repair.item.title,
      :currency    => 'aud'
    )

    @repair.charge_identifier = charge.id
    @repair.save
    redirect_to repairs_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_repair_path(item_id: @repair.item.id)
  end

  private
    def set_repair
    # if params[:id]
      # @item = Item.find_by!(user: params[:id])
    # else
      # @repair = Repair.find_by(user: current_user)
      @repair = Repair.find(params[:id])
    # end
    end


end
