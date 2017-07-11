class WikisController < ApplicationController
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = false
    
    if @wiki.save
      flash[:notice] = "Your wiki post has been created"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was a problem saving your wiki"
      redirect_to[root_path]
    end
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = false
    
    if @wiki.save
      flash[:notice] = "Your updated wiki has been saved"
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving your update"
      redirect_to[@wiki]
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully"
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki"
      redirect_to[@wiki]
    end
  end
  
end
