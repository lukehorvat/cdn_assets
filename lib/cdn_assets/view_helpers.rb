module CdnAssets
  module ViewHelpers
    ASSET_CDN_URLS = {
      bootstrap: {
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/{v}/css/bootstrap.min.css',
        jsdelivr: '//cdn.jsdelivr.net/bootstrap/{v}/css/bootstrap.min.css'
      },
      bootstrap_js: {
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/{v}/js/bootstrap.min.js',
        jsdelivr: '//cdn.jsdelivr.net/bootstrap/{v}/js/bootstrap.min.js',
        netdna: '//netdna.bootstrapcdn.com/twitter-bootstrap/{v}/js/bootstrap.min.js'
      },
      bootstrap_responsive: {
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/{v}/css/bootstrap-responsive.min.css',
        jsdelivr: '//cdn.jsdelivr.net/bootstrap/{v}/css/bootstrap-responsive.min.css',
        netdna: '//netdna.bootstrapcdn.com/twitter-bootstrap/{v}/css/bootstrap-combined.no-icons.min.css'
      },
      bootstrap_responsive_icons: {
        netdna: '//netdna.bootstrapcdn.com/twitter-bootstrap/{v}/css/bootstrap-combined.min.css'
      },
      font_awesome: {
        jsdelivr: '//cdn.jsdelivr.net/fontawesome/{v}/css/font-awesome.min.css',
        netdna: '//netdna.bootstrapcdn.com/font-awesome/{v}/css/font-awesome.min.css'
      },
      jquery: {
        cdnjs: '//cdnjs.cloudflare.com/ajax/libs/jquery/{v}/jquery.min.js',
        google: '//ajax.googleapis.com/ajax/libs/jquery/{v}/jquery.min.js',
        microsoft: '//ajax.aspnetcdn.com/ajax/jQuery/jquery-{v}.min.js'
      }
    }

    def cdn_assets(assets = {})
      assets.map { |asset, options| cdn_asset asset, options }.join("\n").html_safe
    end

    def cdn_asset(asset, options = {})
      cdn = options.delete(:c)
      raise ArgumentError, 'Asset CDN not specified' if cdn.nil?

      version = options.delete(:v)
      raise ArgumentError, 'Asset version not specified' if version.nil?

      cdn_urls = ASSET_CDN_URLS[asset.to_sym]
      raise ArgumentError, 'Invalid asset name specified' if cdn_urls.nil?

      url = cdn_urls[cdn.to_sym]
      raise ArgumentError, 'Invalid CDN name specified' if url.nil?

      url = url.gsub '{v}', version.to_s
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
