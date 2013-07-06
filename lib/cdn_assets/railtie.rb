require 'cdn_assets/view_helpers'

module CdnAssets
  class Railtie < Rails::Railtie
    initializer 'cdn_assets.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
