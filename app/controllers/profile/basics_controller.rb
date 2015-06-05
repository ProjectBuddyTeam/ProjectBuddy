class Profile::BasicsController < ApplicationController
  before_action :set_profile_basic, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profile_basics = Profile::Basic.all
    respond_with(@profile_basics)
  end

  def show
    respond_with(@profile_basic)
  end

  def new
    @profile_basic = Profile::Basic.new
    respond_with(@profile_basic)
  end

  def edit
  end

  def create
    @profile_basic = Profile::Basic.new(profile_basic_params)
    @profile_basic.save
    respond_with(@profile_basic)
  end

  def update
    @profile_basic.update(profile_basic_params)
    respond_with(@profile_basic)
  end

  def destroy
    @profile_basic.destroy
    respond_with(@profile_basic)
  end

  private
    def set_profile_basic
      @profile_basic = Profile::Basic.find(params[:id])
    end

    def profile_basic_params
      params.require(:profile_basic).permit(:identity_member_id, :first_name, :last_name, :github, :deviantart)
    end
end
