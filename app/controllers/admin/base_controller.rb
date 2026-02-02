class Admin::BaseController < ApplicationController
  http_basic_authenticate_with name: "admin", password: ENV.fetch("ADMIN_PASSWORD", "tchanque2024")
  layout "admin"

  before_action :set_admin_title

  private

  def set_admin_title
    @admin_title = "Administration"
  end
end
