class HomeController < ApplicationController
  before_action :authenticate_user!
  def Home

  end
end
