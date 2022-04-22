class ApplicationController < ActionController::Base
  protected

  def after_sign_in_path_for(resource)
    session[:prof_pic] = rand(1..5)
    super
  end
end
