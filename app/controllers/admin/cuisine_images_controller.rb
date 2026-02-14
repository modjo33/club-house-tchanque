class Admin::CuisineImagesController < Admin::BaseController
  before_action :set_cuisine_image, only: [:edit, :update, :destroy]

  def index
    @cuisine_images = CuisineImage.ordered.includes(image_attachment: :blob)
  end

  def new
    @cuisine_image = CuisineImage.new(position: CuisineImage.count)
  end

  def create
    @cuisine_image = CuisineImage.new(cuisine_image_params)
    if @cuisine_image.save
      redirect_to admin_cuisine_images_path, notice: "Image ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @cuisine_image.update(cuisine_image_params)
      redirect_to admin_cuisine_images_path, notice: "Image mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @cuisine_image.destroy

    # Réordonner les positions
    CuisineImage.ordered.each_with_index do |img, i|
      img.update_column(:position, i)
    end

    redirect_to admin_cuisine_images_path, notice: "Image supprimée avec succès."
  end

  private

  def set_cuisine_image
    @cuisine_image = CuisineImage.find(params[:id])
  end

  def cuisine_image_params
    params.require(:cuisine_image).permit(:title, :position, :active, :image)
  end
end
