class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_registration!

  attr_reader :current_user
  helper_method :current_user, :user_signed_in?

  def current_user
    @current_user ||= current_registration.try(:user)
  end

  def user_signed_in?
   registration_signed_in?
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
