module CdnAssets
  module ViewHelpers
    def include_cdn_assets(assets = {})
      assets.map { |asset, opts| include_cdn_asset asset, opts }.join("\n").html_safe
    end

    def include_cdn_asset(asset, opts = {})
      raise ArgumentError, 'Asset CDN not specified' if !opts.has_key? :c
      raise ArgumentError, 'Asset version not specified' if !opts.has_key? :v

      cdn = opts.delete(:c).to_sym
      version = opts.delete(:v).to_s

      case asset
      when :jquery
        version = version.nil? ? Jquery::Rails::JQUERY_VERSION : version
        case cdn
        when :google
          javascript_include_tag "//ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js", opts
        when :jquery
          javascript_include_tag "//code.jquery.com/jquery-#{version}.min.js", opts
        when :microsoft
          javascript_include_tag "//ajax.aspnetcdn.com/ajax/jQuery/jquery-#{version}.min.js", opts
        when :cdnjs
          javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/jquery/#{version}/jquery.min.js", opts
        end
      when :bootstrap_js
        case cdn
        when :netdna
          javascript_include_tag "//netdna.bootstrapcdn.com/twitter-bootstrap/#{version}/js/bootstrap.min.js", opts
        end
      when :bootstrap_css
        case cdn
        when :netdna
          stylesheet_link_tag "//netdna.bootstrapcdn.com/twitter-bootstrap/#{version}/css/bootstrap-combined.min.css", opts
        end
      when :bootstrap_no_icons_css
        case cdn
        when :netdna
          stylesheet_link_tag "//netdna.bootstrapcdn.com/twitter-bootstrap/#{version}/css/bootstrap-combined.no-icons.min.css", opts
        end
      when :font_awesome
        case cdn
        when :netdna
          stylesheet_link_tag "//netdna.bootstrapcdn.com/font-awesome/#{version}/css/font-awesome.min.css", opts
        end
      end
    end
  end
end
