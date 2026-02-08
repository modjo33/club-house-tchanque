class Admin::SessionsController < ActionController::Base
  def destroy
    # Return 401 to force the browser to forget HTTP Basic credentials
    head :unauthorized
  end
end
