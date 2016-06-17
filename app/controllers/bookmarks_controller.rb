class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:index, :edit, :update, :new, :create]
  before_action :store_location, only: [:new, :edit]
  layout 'two_columns', only: [:index]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = Bookmark.where('user_id = ?', current_user.id)
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to stored_location, notice: 'Bookmark was successfully created.' }
        format.json { render :index, status: :created, location: @bookmark }
      else
        format.html { render :new }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        format.html { redirect_to stored_location, notice: 'Bookmark was successfully updated.' }
        format.json { render :index, status: :ok, location: @bookmark }
      else
        format.html { render :edit }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { 
        redirect_to :back, notice: 'Bookmark was successfully destroyed.' rescue redirect_to bookmarks_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = Bookmark.find(params[:id])
    end

    def set_tags
      @tags = Tag.where('user_id = ?', current_user.id)
    end

    def stored_location
      url = stored_location_for(:user)
      url ||= bookmarks_path
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bookmark_params
      params.require(:bookmark).permit(:title, :url, tag_ids: [])
    end
end
