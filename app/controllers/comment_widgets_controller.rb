class CommentWidgetsController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:comments] { |c| c.authorize_show_by_profile_id params[:comment_widget_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_comment_widget params[:id] }
  before_action only: [:comments] { |c| c.set_comment_widget params[:comment_widget_id] }

  before_action :deny_non_admins, only: [:destroy]

  def comments
    @comments = @comment_widget.comments
    respond_to do |format|
      format.json { render json: wrap_response(:comments, @comments) }
      format.html { render action: '../comments/index.html.erb' } 
    end
  end

  # GET /comment_widgets
  # GET /comment_widgets.json
  def index
    @comment_widgets = CommentWidget.all
    respond_to do |format|
      format.json { render json: wrap_response(:comment_widgets, @comment_widgets) }
      format.html
    end
  end

  # GET /comment_widgets/1
  # GET /comment_widgets/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:comment_widgets, @comment_widget) }
      format.html
    end
  end

  # GET /comment_widgets/new
  def new
    @comment_widget = CommentWidget.new
    @comment_widget.post_id = params[:post_id]
  end

  # GET /comment_widgets/1/edit
  def edit
  end

  # POST /comment_widgets
  # POST /comment_widgets.json
  def create
    @comment_widget = CommentWidget.new(comment_widget_params)
    set_created @comment_widget, 'active'  
    respond_to do |format|
      if @comment_widget.save
        format.html { redirect_to @comment_widget, notice: 'Comment widget was successfully created.' }
        format.json { render :show, status: :created, location: @comment_widget }
      else
        format.html { render :new }
        format.json { render json: @comment_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_widgets/1
  # PATCH/PUT /comment_widgets/1.json
  def update
    set_updated @comment_widget
    respond_to do |format|
      if @comment_widget.update(comment_widget_params)
        format.html { redirect_to @comment_widget, notice: 'Comment widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_widget }
      else
        format.html { render :edit }
        format.json { render json: @comment_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_widgets/1
  # DELETE /comment_widgets/1.json
  def destroy
    @comment_widget.destroy
    respond_to do |format|
      format.html { redirect_to comment_widgets_url, notice: 'Comment widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_comment_widget
    @comment_widget = CommentWidget.find_by_id(id)
    return head(:not_found) unless @comment_widget.present?
  end

  private
      
    def comment_widget_params
      params.require(:comment_widget).permit(:post_id, :allow_api_access, :description, :current_score, :commenter_count, :voter_count, :status, :widget_style_id, :created_by, :updated_by)
    end
end
