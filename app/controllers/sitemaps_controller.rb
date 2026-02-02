class SitemapsController < ApplicationController
  def show
    @pages = [
      { url: root_url, changefreq: "weekly", priority: 1.0 },
      { url: carte_url, changefreq: "weekly", priority: 0.9 },
      { url: vins_url, changefreq: "monthly", priority: 0.8 },
      { url: evenements_url, changefreq: "monthly", priority: 0.8 }
    ]

    respond_to do |format|
      format.xml
    end
  end
end
