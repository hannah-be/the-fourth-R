class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end
  
  # GET /profiles/1
  # GET /profiles/1.json
  def show
    redirect_to new_profile_url if @profile.nil?
  end
  
  # GET /profiles/new
  def new
    @profile = Profile.new
    @profile.build_address
  end
  
  # GET /profiles/1/edit
  def edit
    # Have blank profile if the user hasn't created one
    @profile = Profile.new(user: current_user) if @profile.nil?
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    # You cannot edit the profile of another user
      if @profile.nil? || @profile.user != current_user
        redirect_to root_url 
      elsif @profile.update(profile_params) 
        respond_to do |format|
          format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @profile }
        end
      else
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @profile.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profile_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find_by(user: current_user)
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :name, :phone, :photo, :remove_photo, address_attributes: [:street, :suburb, :postcode, :state, :country])
    end
