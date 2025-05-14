class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    render inertia: 'Home/Index'
  end
end
