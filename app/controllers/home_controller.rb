class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:main]

  def info
  end

  def main
  end
end
