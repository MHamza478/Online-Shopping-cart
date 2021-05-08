# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to new_session_url, alert: 'Not authorized' if current_user.nil?
  end
end
