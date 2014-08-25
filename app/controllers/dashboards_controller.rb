class DashboardsController < ApplicationController
  def show
    @text_shout = TextShout.new
    @photo_shout = PhotoShout.new
    @shouts = current_user.shouts
    @followers = current_user.followers
    @followed_users = current_user.followed_users
  end
end
