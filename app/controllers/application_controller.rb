class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :is_login
  
  def redirect_back_or_default default
    if session[:return_to] &&
        session[:return_to] != "/" &&
        session[:return_to] != "#{request.request_uri}" &&
        !session[:return_to].include?( request.path)
      redirect_to(session[:return_to])
      session[:return_to] = nil
      return
    else
      redirect_to(default)
      return
    end
  end

  def is_login

    if session[:is_login] || request.request_uri== "/users/login"|| request.request_uri== "/users/login.html"||
        request.parameters[:controller] == "home" || session[:return_to] == "/"||
        request.parameters[:action] == "connect_us"
    else
      session[:return_to] = request.request_uri

      redirect_to "/users/login"
    end
  end
end
