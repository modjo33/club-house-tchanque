# frozen_string_literal: true

class Admin::SitePhotosController < Admin::BaseController
  before_action :set_site_photo, only: [:edit, :update, :destroy]

  def index
    @photos_by_location = SitePhoto.includes(image_attachment: :blob).ordered.group_by(&:location)
  end

  def new
    @location = params[:location]
    @location_info = SitePhoto.location_info(@location)

    unless @location_info
      redirect_to admin_site_photos_path, alert: "Emplacement invalide"
      return
    end

    @site_photo = SitePhoto.new(location: @location)
    @existing_count = SitePhoto.for_location(@location).count
  end

  def create
    @site_photo = SitePhoto.new(site_photo_params)
    @location_info = SitePhoto.location_info(@site_photo.location)

    # Auto-assign position
    @site_photo.position ||= SitePhoto.for_location(@site_photo.location).count

    if @site_photo.save
      redirect_to admin_site_photos_path, notice: "Photo ajoutée avec succès."
    else
      @existing_count = SitePhoto.for_location(@site_photo.location).count
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @location_info = @site_photo.location_info
  end

  def update
    if @site_photo.update(site_photo_params)
      redirect_to admin_site_photos_path, notice: "Photo mise à jour avec succès."
    else
      @location_info = @site_photo.location_info
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    location = @site_photo.location
    @site_photo.destroy

    # Réordonner les positions restantes
    SitePhoto.for_location(location).each_with_index do |photo, index|
      photo.update_column(:position, index)
    end

    redirect_to admin_site_photos_path, notice: "Photo supprimée avec succès."
  end

  private

  def set_site_photo
    @site_photo = SitePhoto.find(params[:id])
  end

  def site_photo_params
    params.require(:site_photo).permit(:location, :alt_text, :position, :image)
  end
end
