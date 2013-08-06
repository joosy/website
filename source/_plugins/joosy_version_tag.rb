module Jekyll
  require 'net/http'
  require 'json'

  class JoosyVersionTag < Liquid::Tag

    def self.versions
      return @versions if @versions
      @versions = JSON.parse Net::HTTP.get('rubygems.org', '/api/v1/versions/joosy.json')
    end

    def initialize(tag_name, text, tokens)
      text   = text.split(' ')
      @field = text[1]

      @versions = self.class.versions.select do |x|
        x['prerelease'] != (text[0] == 'stable')
      end

      super
    end

    def render(context)
      @versions[0][@field]
    end
  end
end

Liquid::Template.register_tag('joosy_version', Jekyll::JoosyVersionTag)