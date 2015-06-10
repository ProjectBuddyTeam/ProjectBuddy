class Profile::ContactsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_contact

  respond_to :html

  def show
    respond_with @contact, layout: nil
  end

  protected
    def set_contact
      @contact = Profile::Contact.find_by_member_id(params[:id])
    end
end