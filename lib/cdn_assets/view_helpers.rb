module CdnAssets
  module ViewHelpers
    JQUERY_VERSION = Jquery::Rails::JQUERY_VERSION

    def include_cdn_assets(*assets)
      assets.map { |asset| include_cdn_asset asset }.join("\n").html_safe
    end

    def include_cdn_asset(asset)
      case asset
      when :google_jquery
        javascript_include_tag  "//ajax.googleapis.com/ajax/libs/jquery/#{JQUERY_VERSION}/jquery.min.js"
      when :netdna_bootstrap_js
        javascript_include_tag  "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"
      when :netdna_bootstrap_css
        stylesheet_link_tag     "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
      when :netdna_bootstrap_no_icons_css
        stylesheet_link_tag     "//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css"
      when :netdna_font_awesome
        stylesheet_link_tag     "//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css"
      end
    end
  end
end
