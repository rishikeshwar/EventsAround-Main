class AdminController < ApplicationController
  def index
  		redirect_to login_url, notice: "Dont even try to xD"
  end
end
