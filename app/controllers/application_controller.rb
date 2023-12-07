class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  skip_forgery_protection

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized."
    redirect_to(request.referrer || root_path)
  end
end
