class WidgetStylesController < ApplicationController
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:vote_options] { |c| c.authorize_show_by_profile_id params[:widget_style_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_widget_style params[:id] }
  before_action only: [:vote_options] { |c| c.set_widget_style params[:widget_style_id] }

  before_action :deny_non_admins, only: [:destroy]

  def vote_options
    @vote_options = @widget_style.vote_options
    respond_to do |format|
      format.json { render json: wrap_response(:vote_options, @vote_options) }
      format.html { render action: '../vote_options/index.html.erb' } 
    end
  end

  # GET /widget_styles
  # GET /widget_styles.json
  def index
    @widget_styles = WidgetStyle.all
    respond_to do |format|
      format.json { render json: wrap_response(:widget_styles, @widget_styles) }
      format.html
    end
  end

  # GET /widget_styles/1
  # GET /widget_styles/1.json
  def show
    respond_to do |format|
      format.json { render json: wrap_response(:widget_styles, @widget_style) }
      format.html
    end
  end

  # GET /widget_styles/new
  def new
    @widget_style = WidgetStyle.new
  end

  # GET /widget_styles/1/edit
  def edit
  end

  # POST /widget_styles
  # POST /widget_styles.json
  def create
    @widget_style = WidgetStyle.new(widget_style_params)
    set_created @widget_style, 'active'  
    respond_to do |format|
      if @widget_style.save
        format.html { redirect_to @widget_style, notice: 'Widget style was successfully created.' }
        format.json { render :show, status: :created, location: @widget_style }
      else
        format.html { render :new }
        format.json { render json: @widget_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /widget_styles/1
  # PATCH/PUT /widget_styles/1.json
  def update
    set_updated @widget_style
    respond_to do |format|
      if @widget_style.update(widget_style_params)
        format.html { redirect_to @widget_style, notice: 'Widget style was successfully updated.' }
        format.json { render :show, status: :ok, location: @widget_style }
      else
        format.html { render :edit }
        format.json { render json: @widget_style.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /widget_styles/1
  # DELETE /widget_styles/1.json
  def destroy
    @widget_style.destroy
    respond_to do |format|
      format.html { redirect_to widget_styles_url, notice: 'Widget style was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def set_widget_style id
    @widget_style = WidgetStyle.find_by_id(id)
    return head(:not_found) unless @widget_style.present?
  end

  private
  
    def widget_style_params
      params.require(:widget_style).permit(:name, :description, :style_data, :status, :created_by, :updated_by)
    end
end
