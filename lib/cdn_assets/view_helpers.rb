module CdnAssets
  module ViewHelpers
    JQUERY_VERSION = Jquery::Rails::JQUERY_VERSION
    ASSET_URLS = {
      :jquery => "//ajax.googleapis.com/ajax/libs/jquery/#{JQUERY_VERSION}/jquery.min.js",
      :bootstrap => "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css",
      :bootstrap_no_icons => "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css",
      :font_awesome => "//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css"
    }

    def cdn_asset(asset)
      url = ASSET_URLS[asset]
      url.end_with?(".js") ? javascript_include_tag(url) : stylesheet_link_tag(url)
    end
  end
end
