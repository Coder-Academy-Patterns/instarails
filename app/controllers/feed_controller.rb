class FeedController < ApplicationController
  before_action :authenticate_user!

  def index
    @photo_feed = current_user.photo_feed
  end
end
