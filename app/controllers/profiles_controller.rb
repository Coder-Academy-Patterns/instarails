class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    redirect_to edit_profile_url if @profile.nil?
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find_or_initialize_by(user: current_user)
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
    respond_to do |format|
      if is_follow_action?
        @profile.user.toggle_followed_by(current_user)
        format.html { redirect_to @profile.user }
        format.json { render :show, status: :ok, location: @profile }
      elsif @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      # Looking at someone else’s profile
      if params[:id]
        @profile = Profile.find(params[:id])
      # Current user’s profile
      else
        @profile = Profile.find_by(user: current_user)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:username, :name, :bio)
    end

    def is_follow_action?
      params.require(:user)[:follow].present?
    end
end
