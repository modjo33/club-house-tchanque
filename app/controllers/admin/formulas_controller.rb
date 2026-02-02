class Admin::FormulasController < Admin::BaseController
  before_action :set_formula, only: [:edit, :update, :destroy]

  def index
    @formulas = Formula.ordered
  end

  def new
    @formula = Formula.new
  end

  def create
    @formula = Formula.new(formula_params)
    if @formula.save
      redirect_to admin_formulas_path, notice: "Formule ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @formula.update(formula_params)
      redirect_to admin_formulas_path, notice: "Formule mise à jour avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @formula.destroy
    redirect_to admin_formulas_path, notice: "Formule supprimée avec succès."
  end

  private

  def set_formula
    @formula = Formula.find(params[:id])
  end

  def formula_params
    params.require(:formula).permit(:name, :description, :price, :position)
  end
end
