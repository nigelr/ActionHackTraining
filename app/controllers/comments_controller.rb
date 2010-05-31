class CommentsController < ApplicationController
  
  before_filter :get_blog
  
  def index
    @comments = @blog.comments.all
  end
  
  def show
    @comment = @blog.comments.find(params[:id])
  end
  
  def new
    @comment = @blog.comments.new
  end
  
  def create
    @comment = @blog.comments.new(params[:comment])
    if @comment.save
      flash[:notice] = "Successfully created comment."
      redirect_to blog_comment_path(@blog, @comment)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @comment = @blog.comments.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to blog_comment_path(@blog, @comment)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @comment = @blog.comments.find(params[:id])
    @comment.destroy
    flash[:notice] = "Successfully destroyed comment."
    redirect_to blog_comments_path(@blog)
  end
  
  private
  
  def get_blog
    @blog = Blog.find(params[:blog_id])
  end
  
end
