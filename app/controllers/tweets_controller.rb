class TweetsController < ApplicationController

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tags = @tweet.content.scan(/#\w+/).flatten
    @tweet.user_id = current_user.id
    @tweet.save
    respond_to do |format|
      format.html{ redirect_to tweet_path(@tweet) }
      format.js{}
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    @tweet.save
    respond_to do |format|
      format.html{ redirect_to tweet_path(@tweet) }
      format.js{}
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js{}
    end
  end

  def like
    @tweet = Tweet.find(params[:id])
    current_user.like!(@tweet)
    respond_to do |format|
      format.html{ redirect_to :back }
      format.js{}
    end
  end  

  def unlike
    @tweet = Tweet.find(params[:id])
    current_user.unlike!(@tweet)
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
