class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :set_bookmarks, only: [:show]
  before_action :set_tags, only: [:show, :index]
  before_action :store_location, only: [:new, :edit]
  layout 'two_columns', only: [:show]

  # GET /tags
  # GET /tags.json
  def index
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    @tag.user_id = current_user.id

    respond_to do |format|
      if @tag.save
        format.html { redirect_to stored_location(@tag), notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @tag }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to stored_location(@tag), notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def set_bookmarks
      @bookmarks = Bookmark.joins(:tags).where('bookmarks.user_id = :user_id AND tags.user_id = :user_id AND tags.id = :tag_id', 
        { user_id: current_user.id, tag_id: params[:id] })
    end

    def set_tags
      @tags = Tag.where('user_id = ?', current_user.id)
    end

    def stored_location(default)
      url = stored_location_for(:user)
      url ||= default
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:title, :color)
    end
end
