module Jekyll
  require 'net/http'
  require 'json'

  class JoosyVersionTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
    end

    def render(context)
      data = JSON.parse Net::HTTP.get('rubygems.org', '/api/v1/gems/joosy.json')
      data['version']
    end
  end
end

Liquid::Template.register_tag('joosy_version', Jekyll::JoosyVersionTag)