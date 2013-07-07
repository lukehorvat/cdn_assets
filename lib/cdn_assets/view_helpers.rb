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
        case cdn
        when :google
          javascript_include_tag "//ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js", opts
        when :cdnjs
          javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/jquery/#{version}/jquery.min.js", opts
        when :microsoft
          javascript_include_tag "//ajax.aspnetcdn.com/ajax/jQuery/jquery-#{version}.min.js", opts
        end
      when :bootstrap_js
        case cdn
        when :netdna
          javascript_include_tag "//netdna.bootstrapcdn.com/twitter-bootstrap/#{version}/js/bootstrap.min.js", opts
        when :cdnjs
          javascript_include_tag "//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/#{version}/js/bootstrap.min.js", opts
        end
      when :bootstrap
        case cdn
        when :cdnjs
          stylesheet_link_tag "//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/#{version}/css/bootstrap.min.css", opts
        end
      when :bootstrap_responsive
        case cdn
        when :netdna
          stylesheet_link_tag "//netdna.bootstrapcdn.com/twitter-bootstrap/#{version}/css/bootstrap-combined.no-icons.min.css", opts
        when :cdnjs
          stylesheet_link_tag "//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/#{version}/css/bootstrap-responsive.css", opts
        end
      when :bootstrap_responsive_icons
        case cdn
        when :netdna
          stylesheet_link_tag "//netdna.bootstrapcdn.com/twitter-bootstrap/#{version}/css/bootstrap-combined.min.css", opts
        end
      when :font_awesome
        case cdn
        when :netdna
          stylesheet_link_tag "//netdna.bootstrapcdn.com/font-awesome/#{version}/css/font-awesome.min.css", opts
        when :cdnjs
          stylesheet_link_tag "//cdnjs.cloudflare.com/ajax/libs/font-awesome/#{version}/css/font-awesome.min.css", opts
        end
      end
    end
  end
end
