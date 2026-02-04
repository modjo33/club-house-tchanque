# frozen_string_literal: true

class Admin::BeveragesController < Admin::BaseController
  before_action :set_beverage, only: [:edit, :update, :destroy]

  def index
    @beverages_by_category = Beverage.ordered.group_by(&:category)
  end

  def new
    @beverage = Beverage.new(category: params[:category] || "soft")
    @beverage.position = Beverage.where(category: @beverage.category).count
  end

  def create
    @beverage = Beverage.new(beverage_params)
    @beverage.position ||= Beverage.where(category: @beverage.category).count

    if @beverage.save
      redirect_to admin_beverages_path, notice: "Boisson ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @beverage.update(beverage_params)
      redirect_to admin_beverages_path, notice: "Boisson mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    category = @beverage.category
    @beverage.destroy

    # Réordonner les positions
    Beverage.where(category: category).order(:position).each_with_index do |b, i|
      b.update_column(:position, i)
    end

    redirect_to admin_beverages_path, notice: "Boisson supprimée avec succès."
  end

  private

  def set_beverage
    @beverage = Beverage.find(params[:id])
  end

  def beverage_params
    params.require(:beverage).permit(:category, :name, :description, :price, :price_small, :price_medium, :price_large, :position, :active)
  end
end
