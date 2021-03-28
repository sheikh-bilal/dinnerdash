# frozen_string_literal: true

# application helper
class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fname dname])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[fname dname])
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not Authorized to perform this Action.'
    redirect_to(request.referrer || root_path)
  end
end
