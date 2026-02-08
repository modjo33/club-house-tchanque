class Admin::SessionsController < ActionController::Base
  def destroy
    # Redirect with fake credentials to force browser to forget the real ones,
    # then the server rejects them and shows the login prompt again.
    redirect_to "#{request.protocol}logout:logout@#{request.host_with_port}/admin", allow_other_host: true
  end
end
