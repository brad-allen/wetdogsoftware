class PostsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:comment_widget, :comments] { |c| c.authorize_show_by_profile_id params[:post_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_post params[:id] }
  before_action only: [:comment_widget, :comments] { |c| c.set_post params[:post_id] }

  before_action :deny_non_admins, only: [:destroy]

  def comment_widget
    @comment_widget = @post.comment_widget
    respond_to do |format|
      format.json { render json: wrap_response(:comment_widgets, @comment_widget) }
      format.html { render action: '../comment_widgets/index.html.erb' } 
    end
  end

  def comments
    @comments = @post.comment_widget.comments
    respond_to do |format|
      format.json { render json: wrap_response(:comments, @comments) }
      format.html { render action: '../comments/index.html.erb' } 
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    respond_to do |format|
      format.json { render json: wrap_response(:posts, @posts) }
      format.html
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:posts, @post) }
      format.html
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.page_id = params[:page_id]
    @post.group_id = params[:group_id]
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    set_created @post, 'active'  
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    set_updated @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_post id
    @post = Post.find_by_id(id)
    return head(:not_found) unless @post.present?
  end

  private
    
    def post_params
      params.require(:post).permit(:profile_id, :group_id, :page_id, :visibility_id, :post_type, :content, :image, :thumb_image, :status)
    end
end
