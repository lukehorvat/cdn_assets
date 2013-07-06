module CdnAssets
  module ViewHelpers
    def hello(name)
      content_tag :h1, 'Hello, %s!' % name
    end
  end
end
