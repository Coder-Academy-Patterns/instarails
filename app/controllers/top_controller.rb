class TopController < ApplicationController
  def index
    @top_users = User.top_followed
  end
end
