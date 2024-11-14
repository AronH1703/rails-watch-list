class BookmarksController < ApplicationController
  before_action :set_list

  def create
    # Sama og þessar tvær línur núverandi er (dry code)
    # @list = list.find(params[:list_id]) # er búin að gera það í :set_list
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id
    if @bookmark.save
      redirect_to @list, notice: 'Movie was successfully added to the list.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Movie was successfully removed from the list.'
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
