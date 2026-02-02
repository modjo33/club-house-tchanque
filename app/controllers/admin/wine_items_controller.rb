class Admin::WineItemsController < Admin::BaseController
  before_action :set_wine_item, only: [:edit, :update, :destroy]

  def index
    @wine_items = WineItem.ordered
  end

  def new
    @wine_item = WineItem.new
  end

  def create
    @wine_item = WineItem.new(wine_item_params)
    if @wine_item.save
      redirect_to admin_wine_items_path, notice: "Vin ajouté avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @wine_item.update(wine_item_params)
      redirect_to admin_wine_items_path, notice: "Vin mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @wine_item.destroy
    redirect_to admin_wine_items_path, notice: "Vin supprimé avec succès."
  end

  private

  def set_wine_item
    @wine_item = WineItem.find(params[:id])
  end

  def wine_item_params
    params.require(:wine_item).permit(:category, :name, :appellation, :glass_price, :bottle_price, :position)
  end
end
