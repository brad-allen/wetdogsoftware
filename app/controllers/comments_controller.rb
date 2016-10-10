class CommentsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_comment params[:id] }

  before_action :deny_non_admins, only: [:destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    respond_to do |format|
      format.json { render json: wrap_response(:comments, @comments) }
      format.html
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:comments, @comment) }
      format.html
    end
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.comment_widget_id = params[:comment_widget_id]
    
    if !@comment.comment_widget_id.present?
      post_id = params[:post_id]
      comment_widget = CommentWidget.where(post_id:post_id)
      if(comment_widget.present?)
        @comment.comment_widget_id = comment_widget.id
      end
    end
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    set_created @comment, 'active'  
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    set_updated @comment
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_comment id
      @comment = Comment.find_by_id(id)
      return head(:not_found) unless @comment.present?
  end
    end

    
    def comment_params
      params.require(:comment).permit(:profile_id, :comment_widget_id, :content, :vote_score, :upvote, :downvote, :status, :visibility_id, :created_by, :updated_by)
    end
end
