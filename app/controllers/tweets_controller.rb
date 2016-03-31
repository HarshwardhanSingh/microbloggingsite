class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    @tweet.save
    respond_to do |format|
      format.html{ redirect_to tweet_path(@tweet) }
      format.js{}
    end
  end

  def show
    @tweet = Tweet.find(params[:tweet_id])
  end

  def edit
    @tweet = Tweet.find(params[:tweet_id])
  end

  def update
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.update(tweet_params)
    @tweet.save
    respond_to do |format|
      format.html{ redirect_to tweet_path(@tweet) }
      format.js{}
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.destroy
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js{}
    end
  end

  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end
end
