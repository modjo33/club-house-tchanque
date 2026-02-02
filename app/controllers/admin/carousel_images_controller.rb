class Admin::CarouselImagesController < Admin::BaseController
  before_action :set_carousel_image, only: [:edit, :update, :destroy]

  def index
    @carousel_images = CarouselImage.ordered.includes(image_attachment: :blob)
  end

  def new
    @carousel_image = CarouselImage.new
  end

  def create
    @carousel_image = CarouselImage.new(carousel_image_params)
    if @carousel_image.save
      redirect_to admin_carousel_images_path, notice: "Image ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @carousel_image.update(carousel_image_params)
      redirect_to admin_carousel_images_path, notice: "Image mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @carousel_image.destroy
    redirect_to admin_carousel_images_path, notice: "Image supprimée avec succès."
  end

  private

  def set_carousel_image
    @carousel_image = CarouselImage.find(params[:id])
  end

  def carousel_image_params
    params.require(:carousel_image).permit(:page, :position, :alt_text, :image)
  end
end
