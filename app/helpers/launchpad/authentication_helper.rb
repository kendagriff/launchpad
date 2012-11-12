module Launchpad
  module AuthenticationHelper
    def signed_in?
      !session[:user_id].nil?
    end

    def current_user
      @current_user ||= GoogleAuthUserRepository.find(session[:user_id])
    end

    def require_launchpad_authentication
      unless signed_in?
        session[:redirect_to] = request.fullpath
        redirect_to launchpad.new_session_url
      end
    end

    def domain_url
      "http://teachbanzai.com"
    end
  end
end
