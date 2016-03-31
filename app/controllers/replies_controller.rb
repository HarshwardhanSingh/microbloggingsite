class RepliesController < ApplicationController

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.tweet_id = @tweet.tweet_id
    @reply.save
    respond_to do |format|
      format.html{redirect_to tweet_path(@tweet)}
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


end
