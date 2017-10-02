class FeedController < ApplicationController
  def index
    @photo_feed = current_user.photo_feed
  end
end
