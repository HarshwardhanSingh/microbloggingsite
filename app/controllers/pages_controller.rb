class PagesController < ApplicationController

  before_action :authenticate_user!, except:[:welcome]

  def welcome
  end

  def dashboard
    # Display dashboard

    @tweets = Tweet.all.order(created_at: :desc)
  end

  def follow
    # Follow user
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      current_user.follow!(@user)
      respond_to do |format|
        format.html{ redirect_to :back}
        format.js{}
      end
    end
  end

  def unfollow
    # Unfollow user
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      current_user.unfollow!(@user)
      respond_to do |format|
        format.html{ redirect_to :back}
        format.js{}
      end
    end
  end

  def followers
    # Display user's followers
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      @users = @user.followers(User)
    end
  end

  def followings
    # Display user's followings
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      @users = @user.followings(User)
    end
  end

  def userpage
    @user = User.find_by(username: params[:username])
    @tweets = @user.tweets.order(created_at: :desc)
  end
end
