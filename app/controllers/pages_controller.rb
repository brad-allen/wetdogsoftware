class PagesController < ApplicationController  
  before_action only: [:edit, :update] { |c| c.authorize_update_by_profile_id params[:id] }
  before_action only: [:show] { |c| c.authorize_show_by_profile_id params[:id] }
  before_action only: [:posts] { |c| c.authorize_show_by_profile_id params[:page_id] }

  before_action only: [:show, :edit, :update, :destroy] { |c| c.set_page params[:id] }

  before_action only: [:posts] { |c| c.set_page params[:page_id] }

  before_action :deny_non_admins, only: [:destroy]

  def posts
    @posts = @page.posts
     respond_to do |format|
      format.json { render json: wrap_response(:posts, @posts) }
      format.html { render action: '../posts/index.html.erb' } 
    end
  end

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
    @group_id = params[:group_id]
    respond_to do |format|
      format.json { render json: wrap_response(:pages, @pages) }
      format.html
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
     respond_to do |format|
      format.json { render json: wrap_response(:pages, @page) }
      format.html
    end
  end


  def get_actions
      actions = Array.new
      actions << { :symbol => 'link', :js_call => 'two' } 

     respond_to do |format|
      format.json { render json: actions.to_s }
      format.html { render html: actions.to_s }
    end
  end

  def get_fields      
      attribute_list = [:profile_id, :name, :description, :page_order, :status, :group_visibility, :connection_visibility, :users_visibility, :public_visibility, :rating]      
      @page = Page.new      
      fields = Array.new

      attribute_list.each do |attribute|
        fields << { :name => attribute.to_s, :type => @page.column_for_attribute(attribute).type.to_s }      
      end

     respond_to do |format|
      format.json { render json: fields.to_s }
      format.html { render html: fields.to_s }
    end
  end

  # GET /pages/new
  def new
    @page = Page.new
    puts 'group id' + params[:group_id].inspect

    @page.group_id = params[:group_id]
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    set_created @page, 'hidden' 
    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    set_updated @page
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_page id
      @page = Page.find_by_id(id)
      return head(:not_found) unless @page.present?
  end
  
  private
  
    def page_params
      params.require(:page).permit(:profile_id, :name, :description, :page_order, :status, :group_visibility, :connection_visibility, :users_visibility, :public_visibility, :rating, :created_by, :updated_by)
    end
end
