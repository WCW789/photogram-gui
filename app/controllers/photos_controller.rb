class PhotosController < ApplicationController
  def home
    @list_of_photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos_template/home"})
  end

  def create
    @photo = Photo.new
    @photo.image = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")
    @photo.owner_id = params.fetch("input_owner_id")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}", { :notice => "Photo created successfully." })
    else
      redirect_to("/photos/#{@photo.id}", { :notice => "Photo failed to create successfully." })
    end
  end

  def show
    the_id = params.fetch("path_id")
    @photo_information = Photo.where({ :id => the_id })
    @photo = @photo_information.at(0)

    render({ :template => "photos_template/photos" })
  end

  def update
    the_id = params.fetch("path_id")
    @photo = Photo.where({ :id => the_id }).at(0)

    @photo.image = params.fetch("new_image")
    @photo.caption = params.fetch("new_caption")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{@photo.id}", { :notice => "Photo updated successfully." })
    else
      redirect_to("/photos/#{@photo.id}", { :alert => "Photo failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @photos = Photo.where({ :id => the_id }).at(0)

    @photos.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
end
