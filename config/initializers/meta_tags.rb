# frozen_string_literal: true

MetaTags.configure do |config|
  config.title_limit = 70
  config.description_limit = 160
  config.keywords_limit = 255
  config.truncate_site_title_first = false
  config.truncate_on_natural_separator = true
end
