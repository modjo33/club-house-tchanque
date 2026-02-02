class Admin::MenuItemsController < Admin::BaseController
  before_action :set_menu_item, only: [:edit, :update, :destroy]

  def index
    @menu_items = MenuItem.ordered
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to admin_menu_items_path, notice: "Plat ajouté avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to admin_menu_items_path, notice: "Plat mis à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to admin_menu_items_path, notice: "Plat supprimé avec succès."
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:category, :name, :description, :price, :position)
  end
end
