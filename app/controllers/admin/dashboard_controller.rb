class Admin::DashboardController < Admin::BaseController
  def index
    @site_photos_count = SitePhoto.count
    @menu_items_count = MenuItem.count
    @wine_items_count = WineItem.count
    @beverages_count = Beverage.count
    @formulas_count = Formula.count
    @page_contents_count = PageContent.count
    @events_count = Event.count
    @active_events_count = Event.current_events.count
  end
end
