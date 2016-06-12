class PagesController < ApplicationController


  def welcome
  end

  def dashboard
    @tweets = Tweet.all.order(created_at: :desc)
  end

  def followers
  end

  def followings
  end

  def userpage
    @user = User.find_by(username: params[:username])
    @tweets = @user.tweets.all.order(created_at: :desc)
  end

  

end
