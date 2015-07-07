require 'application_responder'

class ApplicationController < ActionController::Base
  # Default responder
  self.responder = ApplicationResponder
  respond_to :html

  # Pundit policy enforcer
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :member_not_authorized

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    # Shim for Pundit to get current user
    def pundit_user
      current_member
    end

    def member_not_authorized
      respond_to do |format|
        format.html { redirect_to request.referrer || root_path }
      end
    end
end
