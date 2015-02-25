class PhotosController < ApplicationController
  def new
    @photo_store = PhotoStore.find params[:photo_store_id]
  end

  def create
    @photo_store = PhotoStore.find params[:photo_store_id]
    @photo = @photo_store.photos.create photo_params
    redirect_to photo_store_path params[:photo_store_id]
  end

  def show
    @photo = Photo.find params[:id]
  end

  def edit
    @photo_store = PhotoStore.find params[:photo_store_id]
    @photo = @photo_store.photos.find params[:id]
  end

  def update
    @photo_store = PhotoStore.find params[:photo_store_id]
    @photo = @photo_store.photos.find params[:id]
    if @photo.update_attributes photo_params
      redirect_to photo_store_photo_path(@photo_store, @photo)
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find params[:id]
    @photo.destroy
    redirect_to photo_store_path @photo.photo_store
  end

  private
  def photo_params
      params.require(:photo).permit(:name, :description)
  end
end