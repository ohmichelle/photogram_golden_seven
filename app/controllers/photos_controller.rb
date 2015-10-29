class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all # list_of_photos = array, where each element is a row in the table represented as an object
  end

  def show
    # Parameters: {"id"=>"1"}
    @id = params["id"]
  end

  def new_form

  end

  def create_row
    # Parameters: {"the_caption"=>"", "the_source"=>""}
    p = Photo.new # create new row for photos table
    p.source = params["the_source"] # fill in user values
    p.caption = params["the_caption"]
    p.save # save

    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    # Parameters: {"id"=>"1"}
    @id = params["id"]
  end

  def update_row
    # Parameters: {"the_caption"=>"", "the_source"=>"", "id"=>"1"}
    @id = params["id"]
    p = Photo.find(@id) # find photo
    p.source = params["the_source"] # fill in new user values
    p.caption = params["the_caption"]
    p.save # save

    redirect_to("http://localhost:3000/photos/#{@id}")
  end

  def destroy
    # Parameters: {"id"=>"1"}
    @id = params["id"]
    p = Photo.find(@id) # find photo
    p.destroy # delete photo

    redirect_to("http://localhost:3000/photos")
  end

end
