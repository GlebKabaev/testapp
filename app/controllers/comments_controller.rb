class CommentsController < ApplicationController
  before_action :set_post, only: %i[index new create]
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :set_post_for_update_destroy_show_edit, only: %i[update destroy show edit]
  
  def index
    @comments = @post.comments
  end

  def show
    
  end

  def new
    @comment = @post.comments.build
  end

  def edit
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_comments_path(@post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @comment.user == current_user
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to post_comments_path(@post), notice: 'Comment was successfully updated.' }
          format.json { render :show, status: :ok, location: @comment }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to post_comments_path(@post), notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id] || params.dig(:comment, :post_id))
  end

  def set_post_for_update_destroy_show_edit
    @post = @comment.post
  end

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :textcomment)
  end
end
