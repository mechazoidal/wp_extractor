module WpExtractor
  class WpExtractor
    VERSION = '1.0.0'
    require 'sequel'
    require_relative 'wp_extractor/post'
    require_relative 'wp_extractor/term'
    require_relative 'wp_extractor/comment'
  end
end
