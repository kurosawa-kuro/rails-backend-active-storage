class ImagesController < ApplicationController
    def index
      @images = Image.all
      render json: @images.map { |image| { id: image.id, title: image.title, path: rails_blob_path(image.path, disposition: "attachment") } }
    end
  
    def create
      @image = Image.new(image_params)
      if @image.save
        render json: { message: 'Image uploaded successfully', id: @image.id }, status: :created
      else
        render json: @image.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def image_params
      params.require(:image).permit(:title, :path)
    end
  end
  