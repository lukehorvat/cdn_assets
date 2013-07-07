module CdnAssets
  module ViewHelpers
    ASSET_URLS = {
      jquery: {
        google: '//ajax.googleapis.com/ajax/libs/jquery/%s/jquery.min.js',
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/jquery/%s/jquery.min.js',
        microsoft: '//ajax.aspnetcdn.com/ajax/jQuery/jquery-%s.min.js'
      },
      bootstrap_js: {
        netdna: '//netdna.bootstrapcdn.com/twitter-bootstrap/%s/js/bootstrap.min.js',
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/%s/js/bootstrap.min.js'
      },
      bootstrap: {
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/%s/css/bootstrap.min.css'
      },
      bootstrap_responsive: {
        netdna: '//netdna.bootstrapcdn.com/twitter-bootstrap/%s/css/bootstrap-combined.no-icons.min.css',
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/%s/css/bootstrap-responsive.css'
      },
      bootstrap_responsive_icons: {
        netdna: '//netdna.bootstrapcdn.com/twitter-bootstrap/%s/css/bootstrap-combined.min.css'
      },
      font_awesome: {
        netdna: '//netdna.bootstrapcdn.com/font-awesome/%s/css/font-awesome.min.css',
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/font-awesome/%s/css/font-awesome.min.css'
      }
    }

    def include_cdn_assets(assets = {})
      assets.map { |asset, options| include_cdn_asset asset, options }.join("\n").html_safe
    end

    def include_cdn_asset(asset, options = {})
      raise ArgumentError, 'Asset CDN not specified' if !options.has_key? :c
      raise ArgumentError, 'Asset version not specified' if !options.has_key? :v

      cdn = options.delete(:c).to_sym
      version = options.delete(:v).to_s

      url = ASSET_URLS[asset][cdn] % version
      if url.end_with? '.js'
        javascript_include_tag url, options
      elsif url.end_with? '.css'
        stylesheet_link_tag url, options
      else
        raise RuntimeError, 'Unexpected asset type encountered' # should never happen
      end
    end
  end
end
