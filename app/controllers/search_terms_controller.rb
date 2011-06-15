class SearchTermsController < ApplicationController
  # GET /search_terms
  # GET /search_terms.xml
  def index
    @search_terms = SearchTerm.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @search_terms }
    end
  end

  # GET /search_terms/1
  # GET /search_terms/1.xml
  def show
    @search_term = SearchTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @search_term }
    end
  end

  # GET /search_terms/new
  # GET /search_terms/new.xml
  def new
    @search_term = SearchTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @search_term }
    end
  end

  # GET /search_terms/1/edit
  def edit
    @search_term = SearchTerm.find(params[:id])
  end

  # POST /search_terms
  # POST /search_terms.xml
  def create
    params[:search_term][:name] = params[:search_term][:new_name].strip
    params[:search_term].delete :new_name
    @search_term = SearchTerm.new(params[:search_term])

    respond_to do |format|
      if @search_term.save
        format.html { redirect_to(search_terms_path, :notice => 'SearchTerm was successfully created.') }
        format.xml  { render :xml => @search_term, :status => :created, :location => @search_term }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @search_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /search_terms/1
  # PUT /search_terms/1.xml
  def update
    @search_term = SearchTerm.find(params[:id])

    respond_to do |format|
      if @search_term.update_attributes(params[:search_term])
        format.html { redirect_to(@search_term, :notice => 'SearchTerm was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @search_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /search_terms/1
  # DELETE /search_terms/1.xml
  def destroy
    @search_term = SearchTerm.find(params[:id])
    @search_term.destroy

    respond_to do |format|
      format.html { redirect_to(search_terms_url) }
      format.xml  { head :ok }
    end
  end
end
