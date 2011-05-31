class TweetsController < ApplicationController
  # GET /tweets
  # GET /tweets.xml
  def index
    @tweets = Tweet.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tweets }
    end
  end

  # GET /tweets/1
  # GET /tweets/1.xml
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.xml
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.xml
  def create
    @tweet = Tweet.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to(@tweet, :notice => 'Tweet was successfully created.') }
        format.xml  { render :xml => @tweet, :status => :created, :location => @tweet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.xml
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to(@tweet, :notice => 'Tweet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.xml
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to(tweets_url) }
      format.xml  { head :ok }
    end
  end
  
  def detail
    tweet = Tweet.get_random_unparsed_tweet
    @tweet = Tweet.new(tweet[1])
    @categories = Category.find :all
  end
  
  def categorize
    @tweet = Tweet.find(params[:id])
    @tweet.people_name = params[:people_name]
    @tweet.address = params[:address]
    @tweet.category = params[:category][:category_id]
    @tweet.parsed = "human_parsed"
    
    respond_to do |format|
      # need to be refactored
      if @tweet.validate
        if @tweet.save
          format.html { redirect_to(detail_tweets_path, :notice => 'Tweet was successfully updated.') }
          format.xml  { head :ok }
        end
      else
        @categories = Category.find :all
        format.html { render :action => "detail" }
        format.xml  { render :xml => @tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

end
