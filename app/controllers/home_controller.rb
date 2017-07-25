class HomeController < ApplicationController
  # ユーザがログインしていないとアクセスできない
  before_action :authenticate_user!

  def index
  end
end
