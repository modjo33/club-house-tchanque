class Admin::DashboardController < Admin::BaseController
  def index
    @carousel_images_count = CarouselImage.count
    @menu_items_count = MenuItem.count
    @wine_items_count = WineItem.count
    @formulas_count = Formula.count
    @page_contents_count = PageContent.count
  end
end
