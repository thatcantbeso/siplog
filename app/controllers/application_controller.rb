class ApplicationController < ActionController::Base
  include Pundit

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :landing
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  skip_forgery_protection

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized."
    redirect_to(request.referrer || root_path)
  end
end
