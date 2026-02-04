class SitemapsController < ApplicationController
  def show
    @pages = [
      { url: root_url, changefreq: "weekly", priority: 1.0, lastmod: Date.current },
      { url: carte_url, changefreq: "weekly", priority: 0.9, lastmod: Date.current },
      { url: vins_url, changefreq: "monthly", priority: 0.8, lastmod: Date.current },
      { url: boissons_url, changefreq: "monthly", priority: 0.8, lastmod: Date.current },
      { url: evenements_url, changefreq: "monthly", priority: 0.8, lastmod: Date.current }
    ]

    respond_to do |format|
      format.xml
    end
  end
end
