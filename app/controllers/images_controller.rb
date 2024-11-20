class ImagesController < ApplicationController
    def index
        @images = Image.all
    end
    
    def new
        @image = Image.new
    end

    def create
        title = params[:image][:title]
        image = Image.new(title: title)
        image.save
        redirect_to '/'
    end
    
    def destroy
        image = Image.find(params[:id])
        image.destroy
        redirect_to '/'
    end
    
    def edit
        @image = Image.find(params[:id])
    end
    
    def update
        @image = Image.find(params[:id])
        title = params[:image][:title]
        @image.update(title: title)
        redirect_to '/'
    end
end
